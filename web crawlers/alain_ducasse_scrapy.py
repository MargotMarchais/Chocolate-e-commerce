import scrapy
import datetime

class Choco(scrapy.Spider):
    name = 'scrapy_ducasse' 
    start_urls = ['https://www.lechocolat-alainducasse.com/fr/coffret-chocolat'] 

    # Coffrets chocolats
    def parse(self, response):
            photo = datetime.datetime.now() 
            for choco in response.css('div.productMiniature.js-product-miniature'): 
                yield {
                    'timestamp_photo': photo,
                    'product_name':  choco.css('h2.productMiniature__title.product-title::text').get().strip(),
                    'product_subname': choco.css('h3.productMiniature__subtitle::text').get().strip(),
                    'image_url': choco.css('img::attr(src)').get(),
                    'product_url': choco.css('section.productMiniature__data a::attr(href)').get(), 
                    'product_weight':  choco.css('span.productMiniature__weight::text').get().strip(),
                    'quantity': choco.css('h2.productMiniature__title.product-title small::text').get(),
                    'price': choco.css('span.productMiniature__price.price.js-product-price::text').get().strip()
                }

    # Tablettes chocolat
            next_page = 'https://www.lechocolat-alainducasse.com/fr/tablette-chocolat' 
            if next_page is not None:
                yield response.follow(next_page, callback = self.parse)

    # Petits plaisirs
            other_page = 'https://www.lechocolat-alainducasse.com/fr/petits-plaisirs' 
            if other_page is not None:
                yield response.follow(other_page, callback = self.parse)

    # Petits déjeuners et goûters
            breakfast_page = 'https://www.lechocolat-alainducasse.com/fr/petit-dejeuner-gouter' 
            if breakfast_page is not None:
                yield response.follow(breakfast_page, callback = self.parse)
    
    # Accessoires
            accessories_page = 'https://www.lechocolat-alainducasse.com/fr/accessoires' 
            if accessories_page is not None:
                yield response.follow(accessories_page, callback = self.parse)

    # Cadeaux
            gifts_page = 'https://www.lechocolat-alainducasse.com/fr/cadeau-chocolat' 
            if gifts_page is not None:
                yield response.follow(gifts_page, callback = self.parse)  

    # Assortiments glaces
            ice_page = 'https://www.lechocolat-alainducasse.com/fr/assortiments-glaces' 
            if ice_page is not None:
                yield response.follow(ice_page, callback = self.parse) 

    # Glaces
            icecream_page = 'https://www.lechocolat-alainducasse.com/fr/glaces' 
            if icecream_page is not None:
                yield response.follow(icecream_page, callback = self.parse) 

    # Sorbets
            sorbet_page = 'https://www.lechocolat-alainducasse.com/fr/sorbets' 
            if sorbet_page is not None:
                yield response.follow(sorbet_page, callback = self.parse) 

    # Sorbets
            granite_page = 'https://www.lechocolat-alainducasse.com/fr/granites' 
            if granite_page is not None:
                yield response.follow(granite_page, callback = self.parse) 

                
                


                

                
    
    

    
                