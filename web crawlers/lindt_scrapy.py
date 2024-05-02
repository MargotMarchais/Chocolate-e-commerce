import scrapy
import datetime 

class Choco(scrapy.Spider):
    name = 'scrapy_lindt' 
    start_urls = ['https://www.lindt.fr/shop'] 

    def parse(self, response):
            product_weight = None
            photo = datetime.datetime.now()
            for choco in response.css('li.item.product.product-item'): 
                yield {
                    'timestamp_photo': photo,
                    'product_name':  choco.css('div.product.details.product-item-details a::text').get().strip(),
                    'image_url': choco.css('img.product-image-photo::attr(src)').get(),
                    'product_url': choco.css('div.product.details.product-item-details a::attr(href)').get(),
                    'product_weight':  product_weight,
                    'price': choco.css('span.price::text').get().strip()
                }
        
    # Next pages:
            next_page = 'https://www.lindt.fr/shop?p=2' 
            if next_page is not None:
                yield response.follow(next_page, callback = self.parse)
