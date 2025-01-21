# Praktikum12 - Skriptimine Linuxis

## 1. Skript (esimene.sh)
### ÜL 1
```bash
#!/bin/sh
echo "Tere, tali!!"
```  
### ÜL 2
```bash
#!/bin/sh
echo "Tere, $1!"
```  
### ÜL 3
```bash
#!/bin/sh

echo "Palun sisestage oma nimi:"
read nimi

echo "Palun sisestage oma eriala:"
read eriala

echo "Palun sisestage oma matriklinumber:"
read matriklinumber

# print andmed
echo "Sisestatud andmed:"
echo "Nimi: $nimi"
echo "Eriala: $eriala"
echo "Matriklinumber: $matriklinumber"
```
