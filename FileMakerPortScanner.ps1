# Prompt the user for the server IP
$serverIP = Read-Host -Prompt "Enter the server IPv4 address to check"
$serverIPv6 = Read-Host -Prompt "Enter the server IPv6 address to check (leave blank if not applicable)"

# Prompt the user for the export file path
if ($IsWindows) {
    $defaultPath = "C:\Reports\FileMaker_Port_Check_Report.txt"
} else {
    $defaultPath = "$HOME/FileMaker_Port_Check_Report.txt"
}

$outputFile = Read-Host -Prompt "Enter the full path for the export file (default: $defaultPath)"
if ([string]::IsNullOrWhiteSpace($outputFile)) {
    $outputFile = $defaultPath
}

# Ensure the directory exists
$outputDir = Split-Path -Path $outputFile -Parent
if (-not (Test-Path -Path $outputDir)) {
    Write-Output "Directory does not exist. Creating $outputDir..."
    New-Item -ItemType Directory -Path $outputDir | Out-Null
}


# Define the list of ports
$portsToCheck = @(80, 443, 2399, 5003, 1895, 5013, 8091, 16001, 16004, 50003, 50004,
    3000, 8998, 9889, 9898, 16003, 16020, 16021, 10050, 10051)

# Initialize the output file
"FileMaker Server Port Connectivity Report" | Out-File -FilePath $outputFile
"Checked on $(Get-Date)" | Out-File -FilePath $outputFile -Append
"Server IPv4: $serverIP" | Out-File -FilePath $outputFile -Append
if ($serverIPv6 -ne "") {
    "Server IPv6: $serverIPv6" | Out-File -FilePath $outputFile -Append
}
"" | Out-File -FilePath $outputFile -Append

# Function to check port connectivity
# Cross-platform Test-Port function
function Test-Port {
    param (
        [string]$IPAddress,
        [int]$Port
    )

    try {
        # Create a TCP client to check the port
        $tcpClient = [System.Net.Sockets.TcpClient]::new()
        $tcpClient.Connect($IPAddress, $Port)
        $tcpClient.Close()
        return "Open"
    } catch {
        return "Closed"
    }
}


# Function to check ICMP connectivity
function Test-ICMP {
    param (
        [string]$IPAddress
    )

    try {
        $pingResult = Test-Connection -ComputerName $IPAddress -Count 4 -WarningAction SilentlyContinue
        if ($pingResult | Where-Object { $_.Status -eq "Success" }) {
            return "Reachable"
        } else {
            return "Unreachable"
        }
    } catch {
        return "Error: $_"
    }
}

# Check ICMP for IPv4
"ICMPv4 Test:" | Out-File -FilePath $outputFile -Append
$icmpv4Status = Test-ICMP -IPAddress $serverIP
"IPv4 ($serverIP): $icmpv4Status" | Out-File -FilePath $outputFile -Append

# Check ICMP for IPv6 if provided
if ($serverIPv6 -ne "") {
    "ICMPv6 Test:" | Out-File -FilePath $outputFile -Append
    $icmpv6Status = Test-ICMP -IPAddress $serverIPv6
    "IPv6 ($serverIPv6): $icmpv6Status" | Out-File -FilePath $outputFile -Append
}

# Check each port and write results to the file
"Port Connectivity Test:" | Out-File -FilePath $outputFile -Append
foreach ($port in $portsToCheck) {
    $status = Test-Port -IPAddress $serverIP -Port $port
    "${port}: ${status}" | Out-File -FilePath $outputFile -Append
}

# Final message
"" | Out-File -FilePath $outputFile -Append
"Connectivity test completed." | Out-File -FilePath $outputFile -Append
