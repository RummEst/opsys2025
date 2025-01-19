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
