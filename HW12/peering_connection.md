1. Создал 2 VPC, в каждом по subnet и 2 route tables.
2. Сделал 1 subnet доступным из интернета:
    - создал internet gw
    - приаттачил его к vpc 1
    - в route table этой vpc сделал новую запись 0.0.0.0/0 на igw
3. Создал в каждой VPC по инстансу (с публичным адресом и новой secure policy для ssh)
4. Настроил Peering connection (не забыть принять запрос в сплывающем окне сверху):
  ![image](https://github.com/user-attachments/assets/1afeae9c-4da3-49d8-a223-78fe6e80f78f)
5. В route tables каждого subnet добавил по новой записи, указывающей на peer-subnet:
  ![image](https://github.com/user-attachments/assets/36623b9f-9926-4109-8a81-3fcc539eda0e)
6. Перекинул по scp .pem-ключ с домашней машины на инстанс из публичного сабнета: `scp -i devops.pem devops.pem ubuntu@54.221.33.92:/home/ubuntu/`
7. Подконнектился на эту машину (через Instance connect)
8. Поменял права на 400 для ключа
9. Подконнектился на инстанс из второго VPC по ssh, используя приватный ip:
  ![image](https://github.com/user-attachments/assets/58756fc7-b20b-4dc1-a038-1ce19a50601f)


