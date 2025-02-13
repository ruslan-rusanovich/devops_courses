# 1. Написать скрипт, пользователь вводит строку из букв и специальных символов в нижнем регистре и верхнем регистре.
# Нужно посчитать, сколько в этой строке больших букв.

characters = input("Введите набор символов:\n")
print(f"Введен набор: {characters}")
upper_alphas = [ch for ch in characters if ch.isalpha() and ch.isupper()]
print(f"Больших букв в строке: {len(upper_alphas)}")