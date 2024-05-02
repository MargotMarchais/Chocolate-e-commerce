import scrapy
import datetime

class Choco(scrapy.Spider):
    name = 'scrapy_jeff_de_bruges' 
    start_urls = ['https://www.jeff-de-bruges.com/toute-la-gamme'] 

    # Chocolat
    def parse(self, response):
        photo = datetime.datetime.now() 
        for choco in response.css('div.col-sm-6.col-lg-4.mb-4'): 
            yield {
                'timestamp_photo': photo,
                'product_name':  choco.css('h2.productTile-title a::text').get(),
                'image_url': choco.css('img.imageContainer-image::attr(src)').get(),
				'product_url': choco.css('h2.productTile-title a::attr(href)').get(),
                'product_weight':  choco.css('div.col-4::text').get(),
                'price': choco.css('span.price-value::text').get()
            }

        # Chocolat (Next pages) :
        choco_next_page = 'https://www.jeff-de-bruges.com/toute-la-gamme?pageNumber-2=' \
              + response.css('li.collectionPagination-item.collectionPagination-item--bordered a::attr(data-page-number)').extract()[1] \
                +'#content' 
        if choco_next_page is not None:
            yield response.follow(choco_next_page, callback = self.parse)

        # Dragees (1st page)
        dragees_page = 'https://www.jeff-de-bruges.com/toutes-les-dragees'
        
        if dragees_page is not None:
            yield response.follow(dragees_page, callback = self.parse)

        # Dragees (next pages):
        next_page = 'https://www.jeff-de-bruges.com/toutes-les-dragees?pageNumber-2' \
              + response.css('li.collectionPagination-item.collectionPagination-item--bordered a::attr(data-page-number)').extract()[2] \
                +'#content' 
        if next_page is not None:
            yield response.follow(next_page, callback = self.parse)
        
        # Dragees
        choco_page = 'https://www.jeff-de-bruges.com/toutes-les-dragees?pageNumber-2=2#content'
        if choco_page is not None:
            yield response.follow(choco_page, callback = self.parse)

        # Glaces (1st page)
        ice_page = 'https://www.jeff-de-bruges.com/glace-party#content'
        if ice_page is not None:
            yield response.follow(ice_page, callback = self.parse)

        # Glaces (Next pages):
        ice_next_page = 'https://www.jeff-de-bruges.com/glace-party?pageNumber-2' \
              + response.css('li.collectionPagination-item.collectionPagination-item--bordered a::attr(data-page-number)').extract()[2] \
                +'#content' 
        if ice_next_page is not None:
            yield response.follow(ice_next_page, callback = self.parse)