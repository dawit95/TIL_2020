from bs4 import BeautifulSoup
from urllib.request import urlopen

url = 'http://www.kleague.com/' # url저장 스트링
with urlopen(url) as response:
    soup = BeautifulSoup(response, 'html.parser')
    for anchor in soup.find_all('a'):
        if anchor.get('href', '/')[0:9]=='/schedule':
            url=anchor.get('href', '/')
            break
url = 'http://www.kleague.com' + url
print(url)

# 일정을 들어감.
with urlopen(url) as response:
    soup = BeautifulSoup(response, 'html.parser')
    for i in soup.find_all(class_="team-match"):
        print(i.select("span.club"))
        print(i.select("div.score"))