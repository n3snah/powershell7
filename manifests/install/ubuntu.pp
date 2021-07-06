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

      case $powershell7::release_type {
        'lts': {
          $pkg_name = 'powershell-lts'
        }
        'stable': {
          $pkg_name = 'powershell'
        }
        'preview': {
          $pkg_name = 'powershell-preview'
        }
        default: {
          $pkg_name = 'powershell'
        }
      }

      apt::source { 'microsoft-prod':
        location => $powershell7::apt_repository,
        repos    => 'main',
        key      => {
          id     => 'BC528686B50D79E339D3721CEB3E94ADBE1229CF',
          server => 'pgp.mit.edu'
        },
        notify   => Exec['apt_update']
      }

      package { $pkg_name:
        ensure  => 'present',
        require => Exec['apt_update']
      }
    }
    default: { }
  }
}
