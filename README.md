# powershell7
[![Build Status](https://travis-ci.com/n3snah/powershell7.svg?branch=master)](https://travis-ci.com/n3snah/powershell7)

This module has been developed to manage the installation of PowerShell 7.

## Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with powershell7](#setup)
    * [Beginning with powershell7](#beginning-with-powershell7)
1. [Usage - Configuration options and additional functionality](#usage)
    * [Install and Enable PowerShell 7](#install-and-enable-powershell-7)
    * [Disable Context Menu Options](#disable-context-menu-options)
    * [Disable PS Remoting](#disable-ps-remoting)
    * [Change Update Notification Settings](#change-update-notification-settings)
    * [Configuring PowerShell Window Settings](#configuring-powerShell-window-settings)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

PowerShell 7 is the latest major update which builds on PowerShell 6 core. This
version of PowerShell brings many new features, cmdlets and includes a number of
bugfixes.

## Setup

### Beginning with powershell7

`include powershell7` is enough to get started and have PowerShell 7 installed on
your windows server.

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
  'powershell_updatecheck' => 'LTS,
}
```

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

## Limitations

Currently this has only been designed and tested for Windows. PowerShell 7 on
Linux is not yet supported in this module.

## Development

If you would like to contribute to this module. Fork me on github, make your
desired changes and create a Pull request back to `n3snah/powershell7`
