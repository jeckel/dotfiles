#!/usr/bin/env python3

import configparser
import sys
import requests
from decimal import Decimal
from os.path import expanduser

config = configparser.ConfigParser()

# File must be opened with utf-8 explicitly
with open(expanduser('~/.config/polybar/scripts/crypto-config.ini'), 'r', encoding='utf-8') as f:
    config.read_file(f)


currencies = [x for x in config.sections() if x != 'general']
base_currency = config['general']['base_currency']

params = {
    "ids": ",".join(currencies),  # On récupère plusieurs cryptos en une seule requête
    "vs_currencies": base_currency
}
response = requests.get("https://api.coingecko.com/api/v3/simple/price", params=params)
response.raise_for_status()  # Vérifie si la requête a réussi
data = response.json()

for currency in currencies:
    icon = config[currency]['icon']
    local_price = round(Decimal(data[currency][f'{base_currency.lower()}']), 2)
    sys.stdout.write(f'{icon} %{{F#6C77BB}}{local_price}%{{F-}}')
    if currency != currencies[-1]:
        sys.stdout.write('  ')
