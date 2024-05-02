import scrapy
import datetime

class Choco(scrapy.Spider):
    name = 'scrapy_maisonduchoco' 
    start_urls = ['https://www.lamaisonduchocolat.com/fr_fr/chocolat-liste?&p=1'] 

    # Chocolats
    def parse(self, response):
            photo = datetime.datetime.now() 
            product_weight = None
            quantity = None
            for choco in response.css('form.item.product.product-item.product_addtocart_form.card.card-interactive.flex.flex-col.w-full.relative'): 
                yield {
                    'timestamp_photo': photo,
                    'product_name':  choco.css('div.flex.flex-col.flex-grow.product-info div a::text').get().strip(), 
                    'image_url': choco.css('img.object-contain::attr(src)').get(),
                    'product_url': choco.css('div.relative.text-center.w-full.mx-auto.mb-3 a::attr(href)').get(),
                    'product_weight':  product_weight,
                    'quantity': quantity,
                    'price': choco.css('span.price::text').get().strip(),
                    'rating': choco.css('span.sr-only::text').get().strip(),
                    'product_description': choco.css('div.flex.flex-col.flex-grow.product-info div:nth-of-type(3) p::text').get()
                }

    # Autres pages (Chocolat)
            for x in range(2,15):
                next_page = 'https://www.lamaisonduchocolat.com/fr_fr/chocolat-liste?&p='+f'{x}'
                if next_page is not None:
                    yield response.follow(next_page, callback = self.parse)

    # Paris 2024 (JO) / Edition limitée
            JO_page = 'https://www.lamaisonduchocolat.com/fr_fr/licence-paris-2024'
            if JO_page is not None:
                yield response.follow(JO_page, callback = self.parse)

    # Patisseries
            pastry_page = 'https://www.lamaisonduchocolat.com/fr_fr/patisseries-liste'
            if pastry_page is not None:
                 yield response.follow(pastry_page, callback = self.parse)

            for x in range(2,15):
                pastry_next_page = 'https://www.lamaisonduchocolat.com/fr_fr/patisseries-liste'+f'{x}'
                if pastry_next_page is not None:
                    yield response.follow(pastry_next_page, callback = self.parse)     

    # Cadeaux
            gifts_page = 'https://www.lamaisonduchocolat.com/fr_fr/cadeaux-liste'
            if gifts_page is not None:
                 yield response.follow(gifts_page, callback = self.parse)

            for x in range(2,15):
                 gifts_next_page = 'https://www.lamaisonduchocolat.com/fr_fr/patisseries-liste'+f'{x}'
                 if gifts_next_page is not None:
                      yield response.follow(gifts_next_page, callback = self.parse)


                    