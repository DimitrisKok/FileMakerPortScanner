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

- **FileMaker Server, primary machine, Open Ports:** 80, 443, 2399, and 5003
- **Database Server, Available ports:** 1895, 5013, 8091, 16001, 16004, 50003, and 50004
- **Web Publishing Engine, Available ports:** 3000, 8998, 9889, 9898, 16003, 16020, and 16021
- **FileMaker Server, secondary machine, Open Ports:** 80, 443, and 16003
- **FileMaker Pro, Open Ports:** 80, 443, and 5003
- **FileMaker Go, Open Ports:** 80, 443, and 5003
- **FileMaker WebDirect, Open Ports:** 80, 443
- **FileMaker Custom Web Publishing, Open Ports:** 80, 443
- **ODBC/JDBC, Open Ports:** 2399
- **FileMaker Data API, Open Ports:** 443
- **FileMaker Admin Console, Open Ports:** 443
- FileMaker Server enables port 10050 to allow Zabbix passive checks and port 10051 to support Zabbix active checks

## Requirements

- Windows operating system with PowerShell 7.4.x or later.
- Basic permissions to execute PowerShell scripts.
- Access to the target server/network for testing.

## Usage

### 1. Download the Script

Clone or download this repository to access the `FileMakerPortScanner.ps1` script.
## 2. Run the Script
Open PowerShell, navigate to the folder containing the script, and execute it:

.\FileMakerPortScanner.ps1
## 3. Provide Input
When prompted:

Enter the IPv4 address of the server.
Optionally, enter the IPv6 address (or leave blank).
Specify the path to save the export file (e.g., C:\Reports\PortCheckReport.txt).
## 4. View the Report
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
## 5. Customize the Port List
You can customize the list of ports to check by modifying the $portsToCheck array in the script.

$portsToCheck = @(80, 443, 5003, 16000)
## Contributing
Feel free to fork this repository and submit pull requests with improvements or additional features.

## License
This project is licensed under the MIT License. See the LICENSE file for details.

```bash
git clone https://github.com/DimitrisKok/FileMakerPortScanner.git


