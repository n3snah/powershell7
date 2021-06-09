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

      file { 'packages-microsoft-prod.deb':
        ensure => file,
        path   => $download_path,
        source => 'https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb'
      }

      package {'packages-microsoft-prod.deb':
        ensure   => 'installed',
        source   => $download_path,
        provider => 'dpkg',
        notify   => Exec['apt_update']
      }

      apt::source {'microsoft-prod':
        location => 'https://packages.microsoft.com/ubuntu/18.04/prod',
        repos    => 'main',
        key      => {
          id     => 'BC528686B50D79E339D3721CEB3E94ADBE1229CF',
          server => 'pgp.mit.edu'
        }
      }

      package {'powershell':
        ensure  => 'present',
        require => [Package['packages-microsoft-prod.deb'], Exec['apt_update']]
      }
    }
    default: { }
  }
}
