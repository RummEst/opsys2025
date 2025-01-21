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

# Kontrollime, kas protsessi nimi on argumendina antud
if [ $# -ne 1 ]; then
    echo "Kasutamine: $0 <protsessi_nimi>"
    exit 1
fi

# Salvestame otsitava protsessi nime
protsessi_nimi=$1

# Muudame eraldajaks rea vahetuse
IFS=$'\n'

# Läbime käsu `ps -A` väljundi rida-realt
for line in $(ps -A); do
    # Lisame rea algusesse tühiku, eemaldame korduvad tühikud ja võtame PID ja nime
    pid=$(echo " $line" | tr -s ' ' | cut -d ' ' -f2)
    nimi=$(echo " $line" | tr -s ' ' | cut -d ' ' -f5)

    # Kui nime väli vastab otsitavale nimele, väljastame tulemuse
    if [ "$nimi" = "$protsessi_nimi" ]; then
        echo "PID: $pid, Nimi: $nimi"
    fi
done
```
img  

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

# Arvutame 9^5 mõlema funktsiooni abil
alus=9
aste=5

echo "Rekursiivne: $(rekursiivne_astendamine $alus $aste)"
echo "Tsükliline: $(tsükliline_astendamine $alus $aste)"
```
