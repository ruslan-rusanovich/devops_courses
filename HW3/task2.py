# 2. Написать скрипт, который будет делать ping google.com. Если сервер отвечает, то выводить - success,
# если нет - doesn't work.

import os


site = "www.google.com"
response = os.system(f"ping -n 1 {site}")
if response == 0:
    print("Success")
else:
    print("Doesn`t work")