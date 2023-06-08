import os
import pandas as pd
import math
from bs4 import BeautifulSoup
import urllib.request
import requests
import time
import re

def google_news_crawling(url):
# 뉴스 제목, url, 시간3개
    link_list = []
    title_list = []
    date_list = []
    res = requests.get(url)#request라이브러리
    res.raise_for_status()
    soup = BeautifulSoup(res.text, 'html.parser')
    tag = soup.find(name = 'div', attrs = {'class':'tsldL Oc0wGc RELBvb'})
    div_tag = tag.find(name = 'div', attrs = {'class':'lBwEZb BL5WZb GndZbb'})
    js_tags = div_tag.find_all(name = 'div', attrs={'class':'NiLAwe y6IFtc R7GTQ keNKEd j7vNaf nID9nc'})
    for js_tag in js_tags:
        news_tag = js_tag.find(name = 'div', attrs = {'class':'xrnccd'})
        article_tag = news_tag.find(name = 'article')
        #print(article_tag)
        article = article_tag.find(name = 'h3', attrs = {'class':'ipQwMb ekueJc RD0gLb'})
        info_tag = article.find(name = 'a')
        try:
            link_tag = article_tag.find(name = 'a', attrs = {'class':'VDXfz'})
            link = link_tag['href']
            date_tag = article_tag.find(name = 'div', attrs = {'class':'QmrVtf RD0gLb kybdz'})
            date_lists = date_tag.find(name = 'div', attrs = {'class':'SVJrMe'})
            date = date_lists.find(name = 'time')
            day = date.get_text()
            title = info_tag.get_text()
            encodedlink = link.encode('utf-8')
            decodedlink = encodedlink.decode('utf-8', 'ignore')
            encodedtitle = title.encode('utf-8')
            decodedtitle = encodedtitle.decode('utf-8', 'ignore')
            link_list.append(decodedlink)
            title_list.append(decodedtitle)
            date_list.append(day)
        except AttributeError:
            continue
        except KeyError:
            continue
    return link_list, title_list, date_list

url = "https://news.google.com/search?q=임금&hl=ko&gl=KR&ceid=KR%3Ako"

news_link_list = []
news_title_list = []
news_date_list = []
l,t,d = google_news_crawling(url)
news_link_list += l
news_title_list += t
news_date_list += d
print(len(news_date_list))
##print(len(news_link_list))
#print(len(news_title_list))
google_dict = {
    '제목': news_title_list,
    '링크': news_link_list,
    '날짜':news_date_list
}
print(google_dict)
df_data = pd.DataFrame(google_dict)#dictionary를 데이터프레임으로 변환
df_data.to_csv('C:/Users/이광호/Desktop/programming/itshirt-cat/websraping_basic/google_news_임금.csv',encoding = 'utf-8-sig')#데이터프레임을 csv로 변환