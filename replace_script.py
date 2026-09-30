import os
import re

directory = r"c:\Users\ss pc\Desktop\SITE_PRONTO_CLOUDFLAREQQ"

replacements = {
    r"Aline Mudanças": "Lucas Construções",
    r"alinesouzademoraes4@gmail\.com": "erico.construcao@gmail.com",
    r"\(65\) 99257-3028": "(11) 99188-9884",
    r"65992573028": "11991889884",
    r"Cáceres - MT": "Francisco Morato - SP",
    r"Cáceres/MT": "Francisco Morato - SP",
    r"Cáceres, MT": "Francisco Morato, SP",
    r"Rua Das Opalas, 55": "Rua Adail Jarbas Duclos, 135",
    r"Loteamento Jardim Leste": "Jardim Florida",
    r"78\.201-166": "07913-100",
    r"78201-166": "07913100",
    r"68\.379\.081/0001-16": "68.397.990/0001-87",
    r"68379081000116": "68397990000187",
    r"68\.379\.081 Aline Souza de Moraes": "68.397.990 Lucas Nascimento de Oliveira",
    r"Aline Souza de Moraes": "Lucas Nascimento de Oliveira",
    r"Transporte Rodoviário de Mudanças": "Obras de alvenaria",
    r"49\.30-2-04": "43.99-1-03",
    r"4930204": "4399103",
    r"transportes": "construções",
    r"transporte": "construção",
    r"mudanças": "reformas",
    r"Mudanças": "Construções e Reformas",
    r"mudança": "reforma",
    r"Mudança": "Reforma",
    r"fretamento": "construção civil",
    r"fretes": "obras",
    r"frete": "obra",
    r"caminhão": "cimento",
    r"transportadora": "construtora"
}

for filename in os.listdir(directory):
    if filename.endswith(".html"):
        filepath = os.path.join(directory, filename)
        with open(filepath, 'r', encoding='utf-8') as file:
            content = file.read()
        
        for old, new in replacements.items():
            content = re.sub(old, new, content, flags=re.IGNORECASE)
            
        with open(filepath, 'w', encoding='utf-8') as file:
            file.write(content)
        print(f"Updated {filename}")
