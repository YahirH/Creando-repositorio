import os

import requests
from lxml import html
from bs4 import BeautifulSoup

#import urlparsee

url=input("ingrese url")



class Scraping:
    
    
    def scrapingLinks(self,url):
            print("\nObteniendo links de la url:"+ url)
        
            try:
                response = requests.get(url)  
                parsed_body = html.fromstring(response.text)
    
                # expresion regular para obtener links
                links = parsed_body.xpath('//a/@href')
    
                print('links %s encontrados' % len(links))
    
                for link in links:
                    print(link)
                    archivo= open("scrapi.txt","a")
                    archivo.write(link)
                    archivo.close()

                
            except Exception as e:
                    print(e)
                    print("Error conexion con " + url)
                    pass

scraping = Scraping()
scraping.scrapingLinks(url)
