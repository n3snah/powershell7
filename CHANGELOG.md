# Changelog

All notable changes to this project will be documented in this file.

## Release 0.4.0 (2021/10/19)

**Features**
- Added: Support for installing PowerShell 7 on Ubuntu 18.04 and Ubuntu 20.04 systems.
- Added: Added information to readme to document any requirements.
- Added: Added new parameter `apt_repository` for Ubuntu PowerShell package management.
- Added: Many params in init.pp are now optional. Mainly because Linux would throw errors if they weren't defined.
- Added: Code coverage reports for RSPEC and Travis CI.
- Updated: Module has been updated to PDK v2.1.1.
- Updated: PowerShell Preview URL has been updated to 7.2.0 Preview 7
- Updated: REFERENCE.md has been regenerated via `puppet strings` to account for new changes for Ubuntu support.

**Bugfixes**
- Fix: Fixed case with `Windows Server 2012 R2` as it wasn't testing correctly.
- Fix: Added in missing Table of Contents link for `PowerShell Windows Colors`.
- Fix: Deploy stage has been set to `master` instead of `main`.

## Release 0.3.0 (2021/05/13)

**Features**
- Added: New file REFERENCE.md which is viewable on the forge.
- Added: New file LICENSE which displays the apache 2.0 module license agreement.
- Added: New files for Github issue templates.
- Added: Generated Puppet Strings Documentation
- Added: New configuration capability to manage PowerShell Profile settings (All Users, Current Host)
- Added: New Data Type Alias `Powershell7::Windowcolor` to restrict Window Background/Foreground to specific colors

**Bugfixes**
- Fix: Removed hardcoded Windows paths from powershell7::install exec resource

## Release 0.2.0 (2021/04/07)

**Features**
- Added: able to set the notification policy for Powershell 7 Update checks.
- Added: added metadata.json tags for better visibility of what this module references.

**Bugfixes**
- Fix: powershell7::install exec kept running due to the creates attribute sourcing the wrong file.
- Fix: installation source URLs now allow HTTP as well has HTTPS locations.
- Fix: supported version of puppet was lowered to `6.0.0` as it works across all Puppet 6 versions.

## Release 0.1.0 (2021/04/06)

**Features**
- Added: Able to install PowerShell 7 on Windows Server (2012 R2, 2016, 2019)

**Bugfixes**

**Known Issues**
