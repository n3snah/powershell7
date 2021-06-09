# powershell7::install
#
# @summary Install PowerShell 7
#
# This class handles the OS detection and loads the appropriate class for PowerShell installation.
#
# @api private
#
class powershell7::install {

  case $facts['operatingsystem'] {
    'windows': {
      include powershell7::install::windows
    }
    'Ubuntu': {
      include powershell7::install::ubuntu
    }
    default: {}
  }
}
