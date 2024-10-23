# Praktikum 5 - Failiõigused Linuxis


### 5.1
**a) Lugemiseks:**
Kataloogil /tmp/kaust: x
Failil minufail.txt: r  

**b) Kustutamiseks:**
Kataloogil /tmp/kaust: wx
Failil minufail.txt: (pole otseseid õigusi vaja)


### 5.2
Shelli skripti käivitamine: Shellis käivitatav skript (nt skript.sh) ei ole binaarfail, vaid tekstifail, mida shell (nt Bash) loeb ja täidab käsuridade kaupa. Selleks, et shell saaks skripti lugeda ja tõlgendada, peab failil olema lisaks käivitamisõigusele ka lugemisõigus.
Edukaks käivitamiseks on vaja vähemalt lugemis- ja käivitamisõigust: ```chmod a+rx Kaust3/skript.sh```


### 5.3
Igal kasutajal on omanimeline grupp, et pakkuda kasutajale turvalist ja eraldatud tööruumi failide ja õiguste haldamisel. See süsteem (User Private Group - UPG) võimaldab vaikimisi luua faile ja kaustu, millel on piiratud juurdepääs teistele kasutajatele, vältides olukorda, kus teised kasutajad saaksid automaatselt juurde pääseda äsja loodud failidele või kataloogidele. Nii tagab UPG, et iga kasutaja saab töötada oma failidega ilma vajaduseta jagada neid teiste kasutajatega, kui nad pole otseselt määranud jagamisõigusi.


### 5.4



### 5.5



### 5.6

Jah, setuid võib vähendada turvalisust, kuna see võimaldab tavakasutajatel käivitada programme kõrgematel õigustel (nt root-i õigustega). Kui programm sisaldab turvavigu, saab ründaja neid ära kasutada, et saada suuremaid õigusi ja kahjustada süsteemi. Setuid-i kasutamine tuleks seetõttu olla väga hoolikas ja piiratud.


### 5.7
Kuna sticky bit on seatud kataloogile /tmp/yhiskaust, saavad peeter-kasutaja loodud faile kustutada ainult:
> peeter (faili omanik),
> õpetaja (kataloogi omanik),
> root (superkasutaja).


### 5.8


### 5.9
Keegi ei saa modifitseerida faili sisu, kui +i (immutability) atribuut on määratud, isegi mitte faili omanik ega root.
