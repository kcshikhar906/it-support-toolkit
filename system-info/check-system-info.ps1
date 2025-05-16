# check-system-info.ps1
# Displays system information

$hostname = $env:COMPUTERNAME
$os = Get-CimInstance Win32_OperatingSystem
$cpu = Get-CimInstance Win32_Processor
$memory = "{0:N2}" -f ($os.TotalVisibleMemorySize / 1MB) + " GB"
$freeMem = "{0:N2}" -f ($os.FreePhysicalMemory / 1MB) + " GB"
$uptime = (Get-Date) - $os.LastBootUpTime
$disks = Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3"

Write-Host "=== System Info for $hostname ===" -ForegroundColor Cyan
Write-Host "OS         : $($os.Caption)"
Write-Host "Version    : $($os.Version)"
Write-Host "CPU        : $($cpu.Name)"
Write-Host "Memory     : $memory (Free: $freeMem)"
Write-Host "Uptime     : $([math]::Floor($uptime.TotalHours)) hours"
Write-Host "`nDrives:" -ForegroundColor Cyan

foreach ($disk in $disks) {
    $used = $disk.Size - $disk.FreeSpace
    $usage = ($used / $disk.Size) * 100
    Write-Host "$($disk.DeviceID) - $([math]::Round($usage,2))% used (`"{0:N2}`" GB free)" -f ($disk.FreeSpace / 1GB)
}

Write-Host "`n✅ System information check complete." -ForegroundColor Green
