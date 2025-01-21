# Praktikum12 - Skriptimine Linuxis

## 1. Skript (esimene.sh)
### ÜL 1
```bash
#!/bin/sh
echo "Tere, tali!!"
```
![image](https://github.com/user-attachments/assets/50989df7-af6c-45f5-9b3e-d5e6c2217394)  

### ÜL 2
```bash
#!/bin/sh
echo "Tere, $1!"
```
![image](https://github.com/user-attachments/assets/30550ca5-eb6b-4502-a56f-79172de3cacf)  

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
![image](https://github.com/user-attachments/assets/18eb748a-bc43-432b-ab23-6c6978c0475d)  

