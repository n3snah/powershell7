# powershell7::install::ubuntu
#
# @summary Install PowerShell 7 on Ubuntu systems
#
# This class handles the installation of PowerShell 7 on supported Ubuntu systems.
#
# @api private
#
class powershell7::install::ubuntu {
  case $facts['operatingsystem'] {
    'Ubuntu': {
      include apt
      $download_path = '/tmp/packages-microsoft-prod.deb'
      # Update the list of products
      # sudo apt-get update

      # require the following packages
      # apt-transport-https software-properties-common

      # Download the following file
      file { 'packages-microsoft-prod.deb':
        ensure => file,
        path   => $download_path,
        source => 'https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb'
      }

      package {'packages-microsoft-prod.deb':
        ensure => 'installed',
        source => $download_path,
        notify => Exec['apt_update']
      }

      # Enable the "universe" repositories
      # sudo add-apt-repository universe

      package {'powershell':
        ensure  => 'present',
        require => Package['packages-microsoft-prod.deb']
      }
    }
    default: { }
  }
}
