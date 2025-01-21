# Praktikum 12 - Skriptimine Linuxis

## 1. Skript (esimene.sh)
#### ÜL 1
```bash
#!/bin/sh
echo "Tere, tali!!"
```
![image](https://github.com/user-attachments/assets/50989df7-af6c-45f5-9b3e-d5e6c2217394)  

#### ÜL 2
```bash
#!/bin/sh
echo "Tere, $1!"
```
![image](https://github.com/user-attachments/assets/30550ca5-eb6b-4502-a56f-79172de3cacf)  

#### ÜL 3
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

## 2. Skript (neljas.sh)  

#### ÜL 4  

```bash
#!/bin/bash

# check et antud 2 argumenti (vana ja uus laiend)
if [ $# -ne 2 ]; then
    echo "Kasutamine: $0 <vana_laiend> <uus_laiend>"
    exit 1
fi

vana_laiend=$1
uus_laiend=$2

# failide loop
for fail in *.$vana_laiend; do
    if [ -f "$fail" ]; then
        uus_fail="${fail%.$vana_laiend}.$uus_laiend"
        mv "$fail" "$uus_fail"
        echo "Nimetasime ümber: $fail -> $uus_fail"
    fi
done

echo "Valmis!"
```
![image](https://github.com/user-attachments/assets/931774e0-ddf0-4be2-a1c8-97c6415931a2)  

## 3. Skript (otsi_protsess.sh)  

#### ÜL 5  

```bash
#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Kasutamine: $0 <protsessi_nimi>"
    exit 1
fi

protsessi_nimi=$1

IFS=$'\n'

for line in $(ps -A); do
    pid=$(echo " $line" | tr -s ' ' | cut -d ' ' -f2)
    nimi=$(echo " $line" | tr -s ' ' | cut -d ' ' -f5)

    if [ "$nimi" = "$protsessi_nimi" ]; then
        echo "PID: $pid, Nimi: $nimi"
    fi
done
```
![image](https://github.com/user-attachments/assets/28bb8256-6979-4c0e-bdab-b5c397fc5788)
  

## 4. Skript (astendamine.sh)  

#### ÜL 6  

```bash
#!/bin/bash

# Rekursiivne
rekursiivne_astendamine() {
    local alus=$1
    local aste=$2

    if [ $aste -eq 0 ]; then
        echo 1  # Iga arvu astend nulliga on 1
    else
        local eelmise_tulemus=$(rekursiivne_astendamine $alus $((aste - 1)))
        echo $((alus * eelmise_tulemus))
    fi
}

# Tsükliline 
tsükliline_astendamine() {
    local alus=$1
    local aste=$2
    local tulemus=1

    for ((i = 1; i <= aste; i++)); do
        tulemus=$((tulemus * alus))
    done

    echo $tulemus
}



# Arvutame 9^5
alus=9
aste=5

echo "Rekursiivne: $(rekursiivne_astendamine $alus $aste)"
echo "Tsükliline: $(tsükliline_astendamine $alus $aste)"
```
![image](https://github.com/user-attachments/assets/bc197eda-5a5c-4298-a242-9715062e568b)

## AI skript.
![{90BF3B88-664F-4683-A422-5F6C12647BED}](https://github.com/user-attachments/assets/24a06f3c-cd78-445f-b5de-81fb04fed9e3)


