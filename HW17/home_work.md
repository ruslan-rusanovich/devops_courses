1. Накатить на EC2 с ansible full-access права на работу с EC2, чтобы не генерировать новый ключ от AWS
2. Написать playbook:
   <pre>
- name: Create EC2 instance and install Docker with Nginx
  hosts: localhost
  gather_facts: no
  vars:
    aws_region: "us-east-1"
    instance_type: "t2.micro"
    ami_id: "ami-084568db4383264d4"
    key_name: "devops"
    security_group: "sg-043fe1ab924e65e0f"
    instance_name: "nginx-instance"
    subnet: "subnet-08091e34ba8747d07"

  tasks:
    - name: EC2
      amazon.aws.ec2_instance:
        region:{{ aws_region }}
        name: {{ instance_name }}
        key_name: {{ key_name }}
        state: "running"
        wait: true
        instance_type: {{ instance_type }}
        vpc_subnet_id: {{ subnet }}
        security_group: {{ security_group }}
        network_interfaces:
          - assign_public_ip: true
        image_id: {{ ami_id }}
        tags:
          Environment: Ansible_tests
      register: ec2

    - name: Add new instance to host group
      add_host:
        hostname: "{{ item.public_ip_address }}"
        groupname: launched
      loop: "{{ ec2.instances }}"
      
- name: Install Docker and run Nginx
  hosts: launched
  become: yes
  vars:
       ansible_ssh_private_key_file: devops.pem
  tasks:
    - name: Update apt cache
      apt:
        update_cache: yes

    - name: Install Docker
      apt:
        name: docker.io
        state: present

    - name: add a user to docker group
      ansible.builtin.user:
        name: ubuntu
        groups: docker
        append: yes

    - name: Start Docker service
      service:
        name: docker
        state: started
        enabled: yes

    - name: Pull Nginx Docker image
      docker_image:
        name: nginx
        tag: latest
        source: pull

    - name: Run Nginx container
      docker_container:
        name: nginx_container
        image: nginx
        state: started
        ports:
          - "80:80"
   </pre>
   
3. Зайти на новый EC2 и проверить, что докер установлен, контейнер крутится.
4. Удалить контейнер руками.
