# Praktikum 3 - Ubuntu paigaldus ja LVM seadistus  

  
###  **Sisukord:**  
  [3.1 Partitsioneerimine](#31-partitsioneerimine)  
  [3.2 Linuxi LVM-partitsioonide seadistamine](#32-linuxi-lvm-partitsioonide-seadistamine)  
  [3.3 Ubuntu paigaldus](#33-ubuntu-paigaldus)   
  [**Extra pildid esitamiseks.**](#extra-pildid-esitamiseks)  
  
## 3.1 Partitsioneerimine

- Ubuntu VirtualBoxi setup.
  > ubuntu-24.04.1-desktop-amd64
    
  ![image](https://github.com/user-attachments/assets/9ce33081-35e5-413c-be6f-0e235599f0ea)
    
  - Try ubuntu:  
      <img src="https://github.com/user-attachments/assets/86571842-7c47-40fd-b1e8-ad04d96239d5" alt="ubscreen" style="width: 50%;">
        

- GParted.
  - Lisasin 2 partitioni
    `ext4 500mb "BOOT"` ja `lvm2-pv 23gb "EXTENDED"`
    <img src="https://github.com/user-attachments/assets/2d03a9bd-9ac9-47be-80d6-56d27f183674" alt="gpscreen" style="width: 75%;">
      


## 3.2 Linuxi LVM-partitsioonide seadistamine  
  
- "partitionmanager" Installimine.  
  `sudo add-apt-repository universe`  
  `sudo apt update`  
  `sudo apt install partitionmanager`  
    
    ![image](https://github.com/user-attachments/assets/82aa7a63-0a09-446d-b958-6d061c384a6a)

- LVMi kasutamine.
  - Lisan volüümide grupp vg_eesnimi ja lisada eelnevalt loodud `/dev/sda2` sinna.
    `sudo vgcreate vg_rumm /dev/sda2`  
  - Lisan loogiline volüüm lvswap Linuxi saalimisala (swap) jaoks suurusega 2048MiB  
    `sudo lvcreate -L 2G -n lvswap vg_rumm`  
  - Lisan loogiline volüüm lvroot Linuxi juurfailisüsteemi jaoks (kogu vaba kettapind)  
    `sudo lvcreate -l 100%FREE -n lvroot vg_rumm`
- **Kontroll.**
    > 1. ![image](https://github.com/user-attachments/assets/2a8e2989-d98d-4be7-8b4d-63da2032f7e4)
    > 2. ![image](https://github.com/user-attachments/assets/7c3fbc85-2f85-4738-8e57-ba20dc34f5a2)
    > 3. ![image](https://github.com/user-attachments/assets/1bd3cb4c-e6ac-4a9e-85ad-9e469ca30663)  ![image](https://github.com/user-attachments/assets/598643b2-a231-42ab-8383-752b754d3a33)

## 3.3 Ubuntu paigaldus

- Installimine
     ![image](https://github.com/user-attachments/assets/5e25ef67-7b9a-4fdb-a78e-8454daee6e0c)
     ![image](https://github.com/user-attachments/assets/d20ef206-4285-4c6e-909b-3d8950f31f0f)
  - Valmis.
      ![image](https://github.com/user-attachments/assets/72cdaaef-804f-4a05-bbfc-4993276eb390)


- Paigaldan Ubuntusse VirtualBoxi draiverid.
    ![image](https://github.com/user-attachments/assets/acacbbd0-d14d-4169-98e1-fa21527a00c0)

# Extra pildid esitamiseks.

> **Lubuntu + screenfetch**
> ![image](https://github.com/user-attachments/assets/84bcf1f1-d131-42b4-aa96-6dcf07db379b)  
  
> **LVM-partitsiooni suurendamine**
> ![image](https://github.com/user-attachments/assets/9c95b476-7f54-461d-bf42-8546e7bc9937)  

> **sudo vgdisplay, sudo lvdisplay - Ei tööta?**
> ![image](https://github.com/user-attachments/assets/b3d51b70-fe38-497b-b89e-26cb970fbdd2)  

> **lsblk & df -h**
> ![image](https://github.com/user-attachments/assets/47b7435a-d292-4193-bde9-ed8285cb6838)
> ![image](https://github.com/user-attachments/assets/e1d73379-e26e-47f4-8929-bd698c6d72e3)  








