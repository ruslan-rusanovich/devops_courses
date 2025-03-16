1. Создал VPC:
![image](https://github.com/user-attachments/assets/4f26c9bb-9fef-4fb9-a034-0bea6ffbcb3d)
2. Создал IGW и прикрутил его к VPC:
![image](https://github.com/user-attachments/assets/ecbe6026-18ed-4f2b-b4c6-2d3874234214)
3. Создал route table, прикрутил её к IGW и добавил доступ в интернет (0.0.0.0.0):
![image](https://github.com/user-attachments/assets/44668a07-2943-4c71-b8f8-9697532b02bf)
и вторую для приватной сети:
![image](https://github.com/user-attachments/assets/4e98ce92-661e-4277-876c-2589c6e8b7c3)
4. Создал приватную и публичную подсети (в публичной добавил Auto-assign public IPv4 address)
![image](https://github.com/user-attachments/assets/f985a033-2667-43a2-8b5b-f05d56a9190d)
5. Создал инстанс в публичной подсети, с новой security group. Проверил, что к машине можно подключится из интернета:
![image](https://github.com/user-attachments/assets/75d7c5c1-03a2-45f4-a320-6b41f4663434)
6. Создал инстанс в приватной подсети:
![image](https://github.com/user-attachments/assets/1f2cdbc4-2087-4a01-8e1c-2dee5e1b254a)




