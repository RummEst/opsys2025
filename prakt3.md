# Praktikum 3 - Ubuntu paigaldus ja LVM seadistus  

  
**Sisukord:**  
  3.1 Partitsioneerimine  
  3.2 Linuxi LVM-partitsioonide seadistamine  
  3.3 Ubuntu paigaldus  
  3.4 Linux versioonid  
  
## 3.1 Partitsioneerimine

- Ubuntu VirtualBoxi setup.
  > ubuntu-24.04.1-desktop-amd64
    
  ![image](https://github.com/user-attachments/assets/9ce33081-35e5-413c-be6f-0e235599f0ea)
  
  - Try ubuntu:
      ![image](https://github.com/user-attachments/assets/86571842-7c47-40fd-b1e8-ad04d96239d5)

- GParted.
  - Lisasin 2 partitioni
    `ext4 500mb "BOOT"` ja `lvm2-pv 23gb "EXTENDED"`
    ![image](https://github.com/user-attachments/assets/2d03a9bd-9ac9-47be-80d6-56d27f183674)


## 3.2 Linuxi LVM-partitsioonide seadistamine

1. `ls`


