# powershell7
[![Build Status](https://travis-ci.com/n3snah/powershell7.svg?branch=master)](https://travis-ci.com/n3snah/powershell7)
[![Coverage Status](https://coveralls.io/repos/github/n3snah/powershell7/badge.svg?branch=master)](https://coveralls.io/github/n3snah/powershell7?branch=master)

This module has been developed to manage the installation of PowerShell 7.

## Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with powershell7](#setup)
    * [Software Prerequisites](#software-prerequisites)
    * [Beginning with powershell7](#beginning-with-powershell7)
1. [Usage - Configuration options and additional functionality](#usage)
    * [Install and Enable PowerShell 7](#install-and-enable-powershell-7)
    * [Disable Context Menu Options](#disable-context-menu-options)
    * [Disable PS Remoting](#disable-ps-remoting)
    * [Change Update Notification Settings](#change-update-notification-settings)
    * [Configuring PowerShell Window Settings](#configuring-powerShell-window-settings)
    * [PowerShell Windows Colors](#powershell-window-colors)
    * [PowerShell release types](#powershell-release-types)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

PowerShell 7 is the latest major update which builds on PowerShell 6 core. This
version of PowerShell brings many new features, cmdlets and includes a number of
bugfixes.

## Setup
### Software Prerequisites
On Ubuntu, this module assumes that you have the following sofware is either already
installed or in a manifest to install as this will attempt to download files from
HTTPS:
1. apt-transport-https
1. software-properties-common

Please refer to the `metadata.json` file for a list of required modules and their
supported versions.

### Beginning with powershell7

`include powershell7` is enough to get started and have PowerShell 7 installed on
your Windows or Linux system.

## Usage

All parameters for this module are contained in the powershell7 class. If you would
like to alter installation settings such as context menu options please see below.

### Install and Enable PowerShell 7
```
include powershell7
```

### Disable Context Menu Options
```
class { 'powershell7':
  'add_explorer_context_menu_openpowershell' => 0,
  'add_file_context_menu_runpowershell'      => 0,
}
```

### Disable PS Remoting
```
class { 'powershell7':
  'enable_psremoting' => 0,
}
```

### Change Update Notification Settings
PowerShell 7 added a new feature to alert users when a newer version of the PowerShell
application is available. This can be configured to `Off`, `Default` or `LTS`.
The notification doesn't provide any capabilities to update PowerShell but just to notify only.
```
class { 'powershell7':
  'powershell_updatecheck' => 'LTS',
}
```
***This won't affect Linux installs at this time.***

### Configuring PowerShell Window Settings
Default PowerShell 7 window behaviour can now be customized which includes changing the size of the
window along with also changing the buffer size and even the background/foreground color.
With PowerShell, the buffer width must be equal to the same size as the window width so there is no
option available to change this setting and will always be set to the same size.
```
class { 'powershell7':
  'config_window_width'    => 400,
  'config_window_height'   => 60,
  'config_buffer_height'   => 7000,
  'config_background_color => 'Blue',
  'config_foreground_color => 'White',
}
```

### PowerShell Window Colors
PowerShell 7 only allows certain colors for the background and the foreground. This is the list of acceptable colors.
* Black
* DarkBlue
* DarkGreen
* DarkCyan
* DarkRed
* DarkMagenta
* DarkYellow
* Gray
* Blue
* Green
* Cyan
* Red
* Magenta
* Yellow
* White

### PowerShell release types
There are 3 versions of powershell which can be installed onto any system.
1. lts - Long Term Support which is aimed at consumers who which to have very stable and long supported releases
1. preview - which is aimed at the more bleeding-edge type releases. Not usually ideal for enterprises.
1. stable - releases where they bring in new features more often than LTS but deemed more stable than preview.

```
class { 'powershell7':
  'release_type => 'lts'
}
```

## Limitations

Currently if you have PowerShell installed on Ubuntu and you decide to change the release type. Puppet is unable to uninstall
the current package and install the new package. If you run a `apt-remove <packagename>` puppets next run should succeed. A
future task will be made available to handle this.

Due to using the Stdlib::Absolutepath and the way that the code is structured. You cannot have `download_dir` set to `C:\`.
This would cause the path to end up something like `C:\\file.msi` which wouldn't be a valid windows path.

## Development

If you would like to contribute to this module. Fork me on github, make your
desired changes and create a Pull request back to `n3snah/powershell7`
