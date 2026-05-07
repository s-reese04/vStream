import os

urls = []

with open("urls.txt") as file:
    for x in file:
        urls.append(file.readline())

for url in urls:
    os.system(f'./download.sh {url}')


file.close()
