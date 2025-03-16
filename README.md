# testcase
Тестовое задание №1
Команда для запуска плейбука:
ansible-playbook -i ./hosts ./docker_install.yml --ask-pass --limit remote

Контейнер с gitlab запущен на виртуалке homelab1:
![image](./images/Screenshot%202025-03-16%20124819.png)

Веб интерфейс доступен по https://gitlab.nez.lcl (только в локальной сети):
![image](./images/gitlab.png)
