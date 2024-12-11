# FileMakerPortScanner

FileMakerPortScanner is a PowerShell script that simplifies the process of checking the connectivity of key FileMaker Server ports. It helps system administrators ensure their FileMaker Server environment is accessible and configured correctly for optimal performance.

## Features

- **ICMP Connectivity Tests**: Tests IPv4 and IPv6 reachability using ICMP (ping).
- **Port Connectivity Tests**: Checks the status of essential FileMaker Server ports (open/closed).
- **Customizable Output**: Exports the results to a specified file for easy sharing and troubleshooting.
- **Predefined Port List**: Includes a comprehensive list of ports required for FileMaker Server functionality.
- **Supports IPv4 and IPv6**: Test both IPv4 and IPv6 addresses as needed.

## Predefined Ports Checked

The script tests the following ports commonly used by FileMaker Server:

- **Web and API Ports**: 80, 443, 5003, 16000+
- **Admin Console Ports**: 2399, 16001, 16004
- **Custom and Legacy Ports**: 3000, 9889, 9898
- **Others**: 50003, 50004, 10050, 10051, and more.

For a complete list of ports, refer to the script.

## Requirements

- Windows operating system with PowerShell 7.4.x or later.
- Basic permissions to execute PowerShell scripts.
- Access to the target server/network for testing.

## Usage

### 1. Download the Script

Clone or download this repository to access the `FileMakerPortScanner.ps1` script.

```bash
git clone https://github.com/DimitrisKok/FileMakerPortScanner.git

2. Run the Script
Open PowerShell, navigate to the folder containing the script, and execute it:

powershell
Copy code
.\FileMakerPortScanner.ps1
3. Provide Input
When prompted:

Enter the IPv4 address of the server.
Optionally, enter the IPv6 address (or leave blank).
Specify the path to save the export file (e.g., C:\Reports\PortCheckReport.txt).
4. View the Report
The script generates a detailed report in the specified file. The report includes:

ICMP reachability status for both IPv4 and IPv6.
Connectivity status for each tested port (open/closed).
Timestamp of the test.

Example Output

FileMaker Server Port Connectivity Report
Checked on 12/11/2024 10:30 AM
Server IPv4: 192.168.1.10
Server IPv6: fe80::1

ICMPv4 Test:
IPv4 (192.168.1.10): Reachable

ICMPv6 Test:
IPv6 (fe80::1): Reachable

Port Connectivity Test:
80: Open
443: Open
2399: Closed
5003: Open
...
5. Customize the Port List
You can customize the list of ports to check by modifying the $portsToCheck array in the script.

$portsToCheck = @(80, 443, 5003, 16000)
Contributing
Feel free to fork this repository and submit pull requests with improvements or additional features.

License
This project is licensed under the MIT License. See the LICENSE file for details.
