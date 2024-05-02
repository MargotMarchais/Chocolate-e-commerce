import requests
import pandas as pd
import datetime

url = "https://prod.mcommerce.franprix.fr/api/franprix/v6/products/bonbons-chocolats"

res = []
for x in range(1,10):
    querystring = {"store_id":"REF","size":"60","page":f"{x}"}

    headers = {
        "accept": "application/json, text/plain, */*",
        "accept-language": "en-US,en;q=0.9",
        "api-key": "fe688212f0188a19b1821b99f3c0845c",
        "cookie": "visid_incap_2218347=58ynnLa/S3aJ5J6mEkoA9aZaMmYAAAAAQUIPAAAAAAA99wzkkdMtnCZbvC6zLS7j; nlbi_2218347=kDDrP5dsnQ/tbZ8ZR/vm5gAAAAB8QX4644m7ZpxqaRmnGjjd; incap_ses_2223_2218347=KZhFAwWG/0bENpbJva7ZHqdaMmYAAAAASy1NkveDtaIHGvKDt4CKSw==; rxVisitor=1714576039421HVSDVTK81R5UM25J2BVUSF5M7MR7V4P3; dtSa=-; dtCookie=v_4_srv_16_sn_32D38DF35CE6E480E2E7D157EA7F519C_app-3Adfb00884de810d48_1_ol_0_perc_100000_mul_1_rcs-3Acss_1; OptanonAlertBoxClosed=2024-05-01T15:07:22.469Z; OptanonConsent=isGpcEnabled=0&datestamp=Wed+May+01+2024+17%3A07%3A22+GMT%2B0200+(Central+European+Summer+Time)&version=202403.1.0&browserGpcFlag=0&isIABGlobal=false&hosts=&genVendors=V2%3A0%2CV12%3A0%2CV8%3A0%2CV3%3A0%2CV1%3A0%2C&consentId=626e47ca-ba65-497f-b3d0-e707dc0a2d22&interactionCount=1&isAnonUser=1&landingPath=NotLandingPage&groups=C0001%3A1%2CC0002%3A0%2CC0003%3A0%2CC0004%3A0%2CC0005%3A0%2CC0017%3A0%2CC0020%3A0%2CFP001%3A0; visid_incap_1886902=GopLoBsNRqiCdT85eVbkqKxaMmYAAAAAQUIPAAAAAABRC5qFkjWQRcGKmcR69Ruo; incap_ses_391_1886902=pz4zD3BSL2hoBs2odBxtBaxaMmYAAAAAWcxfcaJ1p5Ys+ttKJd8S1g==; datadome=JcXAv9pOWoxjRbsdjkG1~_ltVyiyetviMakdX4b6zv2sk5RBisqx3pWjS5qjB6UD13Xlb~TQu0DR6v2SlFhrANLtKlc7MTfeqo1fOkJHnZfqxfhG8iSp7xU2Ao6iaCNG; rxvt=1714578053516|1714576039424; dtPC=16$376039418_491h31vAFNNPTHHCPACLPNFHQFBMRBMJUMAAWKP-0e0",
        "origin": "https://www.franprix.fr",
        "priority": "u=1, i",
        "referer": "https://www.franprix.fr/",
        "sec-ch-ua": "'Chromium';v='124', 'Google Chrome';v='124', 'Not-A.Brand';v='99'",
        "sec-ch-ua-mobile": "?0",
        "sec-ch-ua-platform": "'Windows'",
        "sec-fetch-dest": "empty",
        "sec-fetch-mode": "cors",
        "sec-fetch-site": "same-site",
        "user-agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36"
    }

    r = requests.request("GET", url, headers=headers, params=querystring)

    data = r.json()
    for p in data["products"]["list"]:
        res.append(p)

df = pd.json_normalize(res)
df["timestamp_photo"] = datetime.datetime.now()
df.to_csv('franprix_all_choco.csv')