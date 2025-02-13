import hashlib

with open('testfile.txt', mode='rb') as f:
    content = f.read()
    hashed_content = hashlib.sha256()
    hashed_content.update(content)
    hashed_content = hashed_content.digest()

with open("hashed_f.txt", mode="wb") as f:
    f.write(hashed_content)