
# 🚀 Установка CouchDB сервера для плагина Self-hosted LiveSync в [Obsidian](https://obsidian.md/)
Этот репозиторий предоставляет простой способ развернуть сервер CouchDB, настроенный для использования с плагином [Self-hosted LiveSync](https://github.com/vrtmrz/obsidian-livesync)

> 💡 *У вас нет домена? Не проблема!*  
> Вы можете получить **бесплатный домен** с динамическим DNS на [noip.com](https://www.noip.com/) — этого достаточно для запуска собственного сервера LiveSync на VPS.

## ⚙️ Быстрый старт

1. Сделайте скрипт установки исполняемым

   ```bash
   chmod +x ./install.sh
   ```

2. Запустите скрипт с необходимыми параметрами

   ```bash
   sudo ./install.sh '<ваш_домен>' '<имя_пользователя>' '<пароль>'
   ```

   Замените `<ваш_домен>`, `<имя_пользователя>` и `<пароль>` на соответствующие значения.

## 🔐 Безопасность и доступ
- CouchDB будет доступен по адресу: `https://<ваш_домен>:6984`.- Убедитесь, что порт 6984 открыт в вашем брандмауэре и перенаправлен на ваш сервер.- Для обеспечения безопасности рекомендуется использовать HTTPS.

## 🔄 Настройка плагина Self-hosted LiveSync
1. Установите плагин [Self-hosted LiveSync](https://github.com/vrtmrz/obsidian-livesync) в Obsidan
2. Откройте настройки плагина и выберите "Use the copied setup UI".
3. Вставьте сгенерированный Setup URI и введите соответствующий passphrase.
4. Следуйте инструкциям мастера настройки.


## 📚 Полезные ссылки

- Официальная документация плагина: [vrtmrz/obsidian-livesync](https://github.com/vrtmrz/obsidian-liveync)
- Руководство по настройке собственного сервера: [Setup Own Server](https://github.com/vrtmrz/obsidian-livesync/blob/main/docs/setup_own_serve.md)
- Обсуждение и поддержка: [Discussions](https://github.com/vrtmrz/obsidian-livesync/discussons)
