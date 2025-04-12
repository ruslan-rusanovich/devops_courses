- На galaxy.ansible.com нашёл актуальную роль robertdebock.tomcat
- Установил её в нужную папку: `ansible-galaxy role install robertdebock.tomcat --roles-path /home/ubuntu/roles`
- Методом проб и ошибок понял, что до установки tomcat нужно накатить доп. софт (можно тоже ролями в том же playbook)
- Доустановил роли для доп. софта:
   <pre>
     ansible-galaxy role install robertdebock.bootstrap --roles-path /home/ubuntu/roles
     ansible-galaxy role install robertdebock.core_dependencies --roles-path /home/ubuntu/roles
     ansible-galaxy role install robertdebock.java --roles-path /home/ubuntu/roles
     ansible-galaxy role install robertdebock.service --roles-path /home/ubuntu/roles
   </pre>
- Написал и запустил playbook:
  <pre>
    - name: Install tomcat
      hosts: all
      become: yes
      roles:
        - robertdebock.bootstrap
        - robertdebock.core_dependencies
        - robertdebock.java
        - robertdebock.service
        - robertdebock.tomcat
  </pre> 
- Проверил, что на втором сервере появился сервис tomcat в статусе running: `service tomcat status`
