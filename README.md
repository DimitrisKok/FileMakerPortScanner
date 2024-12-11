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

