## Копирование теста

Копирует тест и все вопросы, которые к нему относятся.
Принимает параметры:
- **id**: id теста, который нужно скопировать
- **name**: новое название копии теста

Вся нужная инфраструктура поднимается в **docker-compose**, конфигурации для **nginx** и **php-fpm** готовы.

#### Развертывание в локальной среде с помощью docker-compose

1. Копируем файл _.env.example_ в файл _.env_. Переменные среды можно изменить, а можно и оставить как есть:
```shell
cp .env.example .env
```
2. Запускаем **docker-compose**:
```shell
docker compose up -d --build
```
3. Когда контейнеры будут подняты, нужно отправить запрос (через браузер или Postman - значения не имеет) на адрес:

   http://localhost/api?module=copy&id=2558&name=name

Если соединение с базой не готово - запрос будет ждать, когда оно будет доступно.

В ответе придет id копии теста.