import requests
import pandas as pd
import datetime
import requests

url = "https://www.abtey.fr/151-nos-produits-chocolates"

results = []

for x in range(1,10):
    querystring = {"page":f"{x}","from-xhr":""}

    headers = {
        "accept": "application/json, text/javascript, */*; q=0.01",
        "accept-language": "en-US,en;q=0.9",
        "cookie": "PrestaShop-25acf40fc8c50cba81373764a620bf43=def50200786050f9c673ad79e45e1561400a35a6b7a7b991d441e68f484da83c739fd9474be5f5724995235b9ef1e138a87913f575adb76fc2a3de4e6e3690c7197d1f7646a4398df3d14b5349c7bc327aa377dbccdeba884cd72ad6f0cfd260a7c06ff6ec955cdeaef580067e0bbaa0deecc0f947ba7386b900732ac095e923e736aebbf3d6cc63edc12d4c32316e373ffee42e8f7e8ff0e46f8836c88fd4f209bcd7; PHPSESSID=g240k24nmmnl9kat27hcbbghcd; PrestaShop-93c6d85acd7c903a2fd9f582928914f1=def50200d42974055a35d72f8eba394f5676fc1105142ac8425d00f5a41b61745898cbb7017d61ec9c8c65126749730e0f985bbc05d2fea350fa8f4075694b803670c01986e51340e7ebea1babcdcca5d9d8da54a02481832a04eafdbd652f9bda31a42fb5e93978efee5e44029667406510f1ada9f43b267cb54fe6743e7af72bab2ebcaf954cff0680cb88472981bbd9814709a323f229b75d18a51e38ce; _ga=GA1.2.739655776.1714659788; __lglaw=0; _gid=GA1.2.876661530.1714821230",
        "priority": "u=1, i",
        "referer": "https://www.abtey.fr/151-nos-produits-chocolates",
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
df.to_csv('C:/Users/margo/Documents/Documents/Formation/Github/Web_scraping/chocolats/abtey_request.csv')