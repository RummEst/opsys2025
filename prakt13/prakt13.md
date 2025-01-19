# Praktikum 13 - Skriptimine Windowsis


# Iseseisev ülesanne - PS Skript:
```ps
$OutputFile = "$(Join-Path $([environment]::GetFolderPath('Desktop')) 'ComputerInfo.txt')"

# Masina nimi, PowerShelli versioon ja Windowsi versioon
$ComputerName = $env:COMPUTERNAME
$PSVersion = $PSVersionTable.PSVersion
$OSVersion = (Get-CimInstance -ClassName Win32_OperatingSystem).Version

# Võrgu konfiguratsioon
$NetworkAdapters = Get-NetAdapter | Where-Object { $_.Status -eq 'Up' }
$NetworkConfig = $NetworkAdapters | ForEach-Object {
    $IPConfig = Get-NetIPAddress -InterfaceIndex $_.InterfaceIndex | Where-Object { $_.AddressFamily -eq 'IPv4' }
    [PSCustomObject]@{
        AdapterName = $_.Name
        IPAddress = $IPConfig.IPAddress
        SubnetMask = $IPConfig.PrefixLength
        Gateway = (Get-NetIPConfiguration -InterfaceIndex $_.InterfaceIndex).IPv4DefaultGateway.NextHop
        DHCPEnabled = $_.DhcpEnabled
        MACAddress = $_.MacAddress
    }
}

# Protsessori kirjeldus ja RAM
$SystemInfo = Get-CimInstance -ClassName Win32_ComputerSystem
$Processor = $SystemInfo.Processor
$TotalRAM = [math]::Round($SystemInfo.TotalPhysicalMemory / 1GB, 2)

# Graafikakaardi info
$Graphics = Get-CimInstance -ClassName Win32_VideoController | ForEach-Object {
    [PSCustomObject]@{
        Name = $_.Name
        DriverVersion = $_.DriverVersion
        DriverDate = $_.DriverDate
        Resolution = "{0}x{1}" -f $_.CurrentHorizontalResolution, $_.CurrentVerticalResolution
    }
}

# Kõvaketaste info
$DiskInfo = Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DriveType=3" | ForEach-Object {
    [PSCustomObject]@{
        Drive = $_.DeviceID
        TotalSpaceGB = [math]::Round($_.Size / 1GB, 2)
        FreeSpaceGB = [math]::Round($_.FreeSpace / 1GB, 2)
    }
}

# PCI-seadmed
$PCIInfo = Get-CimInstance -ClassName Win32_PnPEntity | Where-Object { $_.PNPClass -eq 'PCI' } | ForEach-Object {
    [PSCustomObject]@{
        Description = $_.Description
        Manufacturer = $_.Manufacturer
        DriverVersion = $_.DriverVersion
    }
}

# Arvutis olevad kasutajad
$Users = Get-CimInstance -ClassName Win32_UserAccount | ForEach-Object {
    [PSCustomObject]@{
        Name = $_.Name
        Description = $_.Description
        LocalAccount = $_.LocalAccount
        Disabled = $_.Disabled
    }
}

# Käimasolevate protsesside arv
$ProcessCount = (Get-Process).Count

# 10 viimasena käivitatud protsessi
$RecentProcesses = Get-Process | Where-Object { $_.StartTime -ne $null } |
    Sort-Object StartTime -Descending | Select-Object -First 10 |
    Select-Object Name, Id, StartTime

# Arvuti kuupäev ja kellaaeg
$CurrentDateTime = Get-Date

# Salvestamine faili
$Output = @(
    "Masina nimi: $ComputerName",
    "PowerShelli versioon: $PSVersion",
    "Windowsi versioon: $OSVersion",
    "",
    "Võrgu konfiguratsioon:",
    $NetworkConfig | Format-Table | Out-String
    "",
    "Protsessor: $Processor",
    "RAM kokku: ${TotalRAM}GB",
    "",
    "Graafikakaardi info:",
    $Graphics | Format-Table | Out-String
    "",
    "Kõvaketaste info:",
    $DiskInfo | Format-Table | Out-String
    "",
    "PCI-seadmed:",
    $PCIInfo | Format-Table | Out-String
    "",
    "Arvutis olevad kasutajad:",
    $Users | Format-Table | Out-String
    "",
    "Käimasolevate protsesside arv: $ProcessCount",
    "",
    "10 viimasena käivitatud protsessi:",
    $RecentProcesses | Format-Table | Out-String
    "",
    "Arvuti kuupäev ja kellaaeg: $CurrentDateTime"
)

$Output | Out-File -FilePath $OutputFile -Encoding UTF8
Write-Host "Info salvestatud faili: $OutputFile"

```

## Koodikirjeldus

Skript kogub ja salvestab arvuti süsteemi kohta teavet, et luua põhjalik ülevaade arvuti riistvarast ja tarkvarast. Siin on selgitus olulisematest käskudest ja käsu osadest:

### Muutujate määramine
- `$OutputFile`: Failitee, kuhu salvestatakse kogutud teave (desktopil).
- `$ComputerName`, `$PSVersion`, `$OSVersion`: Arvuti nimi, PowerShelli versioon ja Windowsi versioon.

### Võrgu konfiguratsioon
- `Get-NetAdapter`: Loetleb kõik võrguadapterid, mille olek on "Up" (aktiveeritud).
- `Get-NetIPAddress`: Kogub IPv4 aadressi ja alamside maski iga võrguadapteri kohta.
- `Get-NetIPConfiguration`: Leiab vaikevärava aadressi.

### Protsessor ja RAM
- `Get-CimInstance -ClassName Win32_ComputerSystem`: Kogub teavet protsessori ja mälu kohta.
- `TotalPhysicalMemory`: Kõik füüsiline mälu (RAM), ümardatud GB-desse.

### Graafikakaardi info
- `Get-CimInstance -ClassName Win32_VideoController`: Kogub teavet graafikakaardi kohta, sealhulgas draiveri versioon ja kuvasuhe.

### Kõvakettad
- `Get-CimInstance -ClassName Win32_LogicalDisk`: Kogub kõvakettaste kohta teavet, sealhulgas vaba ja kogu ruumi suurused.

### PCI-seadmed
- `Get-CimInstance -ClassName Win32_PnPEntity`: Loetleb kõik PCI-seadmed ja nende üksikasjad (tootja, draiveri versioon).

### Kasutajad ja protsessid
- `Get-CimInstance -ClassName Win32_UserAccount`: Loetleb arvuti kasutajad ja nende staatuse.
- `Get-Process`: Arvutab käimasolevate protsesside arvu ja toob välja 10 viimati käivitatud protsessi.

### Kuupäev ja kellaaeg
- `Get-Date`: Kogub praeguse kuupäeva ja kellaaega.

### Salvestamine faili
- `Out-File`: Salvestab kõik kogutud andmed määratud faili teele.
- `Write-Host`: Kuvab ekraanil sõnumi, et info on salvestatud.

Kood genereerib aruanne, mis sisaldab kõiki neid süsteemiandmeid ja salvestab need tekstifaili.
