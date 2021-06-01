# powershell7::install
#
# @summary Install PowerShell 7
#
# This class handles the OS detection and loads the appropriate class for PowerShell installation.
#
# @api private
#
class powershell7::install {

  case $facts['osfamily'] {
    'windows': {
      include powershell7::install::windows
    }
    'Debian': {
      include powershell7::install::debian
    }
    default: {}
  }
}
