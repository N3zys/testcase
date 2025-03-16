#!/bin/bash

# Настройки GitLab
GITLAB_URL="https://gitlab.nez.lcl"
API_TOKEN="${API_TOKEN}" #Токен в переменной окружения

# Запрос данных о пользователе из консоли
echo "Введите данные для нового пользователя:"
read -p "Имя пользователя (например, John Doe): " USER_NAME
read -p "Email пользователя: " USER_EMAIL
read -p "Имя пользователя (логин): " USER_USERNAME
read -sp "Пароль пользователя: " USER_PASSWORD
echo 

echo "Создание пользователя..."
RESPONSE=$(curl -s --header "PRIVATE-TOKEN: $API_TOKEN" \
  --request POST "$GITLAB_URL/api/v4/users" \
  --data-urlencode "name=$USER_NAME" \
  --data-urlencode "email=$USER_EMAIL" \
  --data-urlencode "password=$USER_PASSWORD" \
  --data-urlencode "username=$USER_USERNAME")

# Проверка ответа
if [[ $(echo "$RESPONSE" | jq -r '.message') == "null" ]]; then
  echo "Пользователь успешно создан:"
  echo "$RESPONSE" | jq
else
  echo "Ошибка при создании пользователя:"
  echo "$RESPONSE" | jq
fi