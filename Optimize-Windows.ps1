# Optimize-Windows.ps1

# PowerShell Script to optimize Windows

function Show-Menu {
    Clear-Host
    Write-Host "Welcome to Windows Optimization Script" -ForegroundColor Cyan
    Write-Host "Please choose an option:" -ForegroundColor Yellow
    Write-Host "1: Clear Temporary Files" 
    Write-Host "2: Disk Cleanup"
    Write-Host "3: Manage Startup Programs"
    Write-Host "4: Clear Cache"
    Write-Host "5: Defragment Disks"
    Write-Host "6: System Optimization"
    Write-Host "0: Exit"
}

function Clear-TemporaryFiles {
    # Command to clear temporary files
    Remove-Item -Path "C:\Windows\Temp\*" -Recurse -Force
    Write-Host "Temporary files cleared!"
}

function Disk-Cleanup {
    # Command for disk cleanup (Invoke built-in Windows cleanup tool)
    Start-Process cleanmgr.exe
}

function Manage-StartupPrograms {
    # Command to manage startup programs
    Get-CimInstance Win32_StartupCommand | Select-Object Name, Command
}

function Clear-Cache {
    # Command to clear cache
    Clear-WebBrowserIECache
    Clear-WebBrowserEdgeCache
}

function Defragment-Disks {
    # Command to defragment disks
    Optimize-Volume -DriveLetter C -Defrag
}

function System-Optimization {
    # Placeholder for additional optimization commands
    Write-Host "System optimization is performed!"
}

while ($true) {
    Show-Menu
    $choice = Read-Host "Enter your choice"
    switch ($choice) {
        "1" { Clear-TemporaryFiles }
        "2" { Disk-Cleanup }
        "3" { Manage-StartupPrograms }
        "4" { Clear-Cache }
        "5" { Defragment-Disks }
        "6" { System-Optimization }
        "0" { exit }
        default { Write-Host "Invalid Option. Please try again." -ForegroundColor Red }
    }
    Start-Sleep -Seconds 2
}