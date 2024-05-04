import requests
import pandas as pd
import datetime
import requests

import requests

url = "https://www.chocolat-castelain.fr/3-les-chocolats"

results = []

for x in range(1,10):
    querystring = {"page":f"{x}","from-xhr":""}

    headers = {
        "accept": "application/json, text/javascript, */*; q=0.01",
        "accept-language": "en-US,en;q=0.9",
        "cookie": "PHPSESSID=d58e9bbf074be1c0b96edf186ed097c1; _ga=GA1.2.2022625514.1714659846; PrestaShop-658b336d74baa85265762ec755e96f54=def502003b4919803cb0fd10dbd0e2025941d5d2f3eb0457db3c0923043357f4d695969dc36e6921eb0d30addfdc9746be74ce806432ab9a27e427bedf145e5ad3c832e08d2025c935ff3a7893844fd769e974a5bc9ac0f2e901e8db64ab3f1f827a381d6fc7eaa1ba797d065106afbdcd342a0ce62cf3400d6b1ffe8993a6ac8c8e25a974c4330341c0b1476b575917a5532a4a37dc94d470c989c295edab47a7d53b4026dfd8bb2b3ce2d144a4df6a6fefbe884af9cac343b1ecfedcde96941d13f8bce78207071b; _gid=GA1.2.1325050481.1714822540; nov_grid_list=list; _gat=1; _ga_72PKLELWCH=GS1.2.1714822540.2.1.1714822605.0.0.0",
        "priority": "u=1, i",
        "referer": "https://www.chocolat-castelain.fr/3-les-chocolats",
        "sec-ch-ua": '"Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"',
        "sec-ch-ua-mobile": "?0",
        "sec-ch-ua-platform": '"Windows"',
        "sec-fetch-dest": "empty",
        "sec-fetch-mode": "cors",
        "sec-fetch-site": "same-origin",
        "user-agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36",
        "x-requested-with": "XMLHttpRequest"
    }

    response = requests.request("GET", url, headers=headers, params=querystring)

    data = response.json()
    for p in data["products"]:
        results.append(p)

df = pd.json_normalize(results)
df["timestamp_photo"] = datetime.datetime.now()
df.to_csv('C:/Users/margo/Documents/Documents/Formation/Github/Web_scraping/chocolats/chocolat_castelain_request.csv')