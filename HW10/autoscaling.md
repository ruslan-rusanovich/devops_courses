### Создаём Launch Template
- ставим чекбокс Autoscaling Guidance
- выбираем тип ОС, тип процессора и ключ (как при создании обычного инстанса)
- разбираемся с настройками Network
- Create Launch Template
- Create Auto Scaling group

### Auto Scaling Group
- Задаём имя и свежесозданный launch template
- Выбираем VPC и Availability Zone c подсетью
- Skip to review
- Заходим в  созданную группу и редактируем scaling limits (min - 1, max - 2, desired - 1)
- В Automatic scaling создаём новый dynamic scaling policy (target tracking) на average CPU utilization

### Нагружаем инстанс
- Коннектимся к пока единственному инстансу
- Устанавливаем утилиту stress (sudo apt-get install stress)
- Запускаем (stress -c 1)
- Пьём чай
- Видим, что запустился второй инстанс:
![image](https://github.com/user-attachments/assets/f27e22e7-b4a8-4f6d-be30-3e2ee0547940)
- Выключаем stress-test
- Допиваем чай
- Видим, что второй инстанс выключился:
![image](https://github.com/user-attachments/assets/93b1e33c-323b-4413-8de2-0775fac1690a)

