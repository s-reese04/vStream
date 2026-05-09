import subprocess

urls = []
with open("urls.txt") as file:
    for line in file:
        urls.append(line.strip())

for url in urls:
    result = subprocess.run(['./download.sh', url, './videos'])
    if result.returncode != 0:
        print(f"Failed: {url}")
    else:
        print(f"Done: {url}")
