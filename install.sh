#!/bin/bash

# Check if script is run with sudo
if [ "$EUID" -ne 0 ]; then
  echo "❌ Please run this script with sudo"
  exit 1
fi

# Check if argument is provided
if [ -z "$1" ]; then
  echo "❌ Required website name not provided!"
  exit 1
fi

# Check if argument is provided
if [ -z "$2" ]; then
  echo "❌ Required username not provided!"
  exit 1
fi

# Check if argument is provided
if [ -z "$3" ]; then
  echo "❌ Required password not provided!"
  exit 1
fi


# Check if certbot is installed
if ! command -v certbot >/dev/null 2>&1; then
  echo "⚙️ Installing certbot..."
  apt update
  apt install -y certbot
else
  echo "✅ Certbot is already installed"
fi


# Check if Docker is installed
if ! command -v docker >/dev/null 2>&1; then
  echo "⚙️ Installing Docker..."
  curl -fsSL https://get.docker.com -o get-docker.sh
  sh get-docker.sh

  echo "✅ Docker has been installed"
else
  echo "✅ Docker is already installed"
fi


YOUR_WEBSITE=$1

# generate ssl certs with certbot
certbot certonly --standalone -d "$YOUR_WEBSITE"


# create .env file
cp dev.env .env

user_escaped=$(printf '%s\n' "$2" | sed -e 's/[\/&]/\\&/g')
pass_escaped=$(printf '%s\n' "$3" | sed -e 's/[\/&]/\\&/g')

sed -i "s/COUCHDB_USER=<username>/COUCHDB_USER=$user_escaped/" .env
sed -i "s/COUCHDB_PASSWORD=<password>/COUCHDB_PASSWORD=$pass_escaped/" .env


# copy pem files to certs/
cp sudo cp "/etc/letsencrypt/live/$YOUR_WEBSITE/fullchain.pem" certs/
cp sudo cp "/etc/letsencrypt/live/$YOUR_WEBSITE/privkey.pem" certs/

# change access to folders
chmod 777 ./data/
chmod 644 ./certs/

# run couchdb server with docker-compose
docker compose up -d
