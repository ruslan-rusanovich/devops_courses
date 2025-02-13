# 3. Написать скрипт, который будет выводить текущую дату и время.

from datetime import datetime

curr_datetime = datetime.now()
print(f"Today is: {curr_datetime}")