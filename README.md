# Setup CouchDB for self-hosted Obsidian

```shell
# generate ssl certs with certbot

# create .env file
cp dev.env .env
# change username and password


# copy pem files to certs/
sudo cp sudo cp /etc/letsencrypt/live/<your-website>/fullchain.pem certs/
sudo cp sudo cp /etc/letsencrypt/live/<your-website>/privkey.pem certs/

# change access to folders
chmod 777 data/
chmod 644 certs/

# run couchdb server with docker-compose
docker compose up -d
```
