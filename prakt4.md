# Praktikum 4 - Windowsi seadistamine ja turvalisus


### 4.1
![image](https://github.com/user-attachments/assets/b6dfd1ad-0c06-499e-980b-8f6656389e77)

### 4.2
![image](https://github.com/user-attachments/assets/11ecfda9-f912-4c56-b664-262bc8171aef)

### 4.3
![image](https://github.com/user-attachments/assets/49be262d-5bfd-40ed-870d-86888290c8fa)

### 4.4
| **Privilege Name**              | **SYSTEM** | **Administrator** | **Difference Importance**                                                                                     |
|---------------------------------|------------|-------------------|---------------------------------------------------------------------------------------------------------------|
| **SeTcbPrivilege**              | Enabled    | Missing           | SYSTEM can "Act as part of the OS," critical for system processes.                                             |
| **SeLockMemoryPrivilege**       | Enabled    | Disabled          | SYSTEM can lock memory pages, essential for kernel-level processes.                                            |
| **SeAuditPrivilege**            | Enabled    | Missing           | SYSTEM can generate security audits, crucial for tracking system events.                                       |
| **SeCreatePermanentPrivilege**  | Enabled    | Missing           | SYSTEM can create permanent shared objects used for system-wide operations.                                    |
| **SeDebugPrivilege**            | Enabled    | Disabled          | SYSTEM can debug kernel and system processes, which Administrator can't.                                       |

  
**Üks tegevus, mille jaoks on vaja SYSTEMi õigusi:**  
  > LSASS-i (Local Security Authority Subsystem Service) ligipääs.  
  > SYSTEM konto saab täielikult ligi LSASS protsessile, mis haldab kasutajate autentimist ja turvalisuse poliitikaid. Seda õigust vajavad näiteks paroolide haldusvahendid ja turvalisuse diagnostikavahendid.  

### 4.5
|  **tootaja1, tootaja2, ylemus** |
|---|
|  ![image](https://github.com/user-attachments/assets/28d4b12f-4eb3-44e5-94fa-59ae132ced70)  |
|  ![image](https://github.com/user-attachments/assets/b06339b8-852a-45a1-8b50-42e6aa5331c7)  |
|  ![image](https://github.com/user-attachments/assets/931abea2-ee6e-4af9-b5db-3b01e639c15a)  |


### 4.6
![image](https://github.com/user-attachments/assets/948bc863-8747-4413-915d-8c47e51ef308)

### 4.7
  *Valisin thonny asemel "Advanced Port Scanner", Väiksema filesize pärast*
  ![image](https://github.com/user-attachments/assets/cbf63157-6195-4d2c-870c-919f73c9fb0f)


### 4.8
![image](https://github.com/user-attachments/assets/4190ef1c-43c6-4d9a-a0f4-55dae1037fc3)

### 4.9
![image](https://github.com/user-attachments/assets/e75338c4-1dfd-4619-b55d-bdc87db380e0)

### 4.10

Register muutetud aga ei tööta.

![image](https://github.com/user-attachments/assets/ea31cd87-bacb-423f-a8c7-e1da55db17db)
![image](https://github.com/user-attachments/assets/8b6e9742-3997-4c8e-8b89-f788bfc8d495)
