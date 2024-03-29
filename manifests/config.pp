# @summary Configuration options for Powershell 7 once installed
#
# Once Powershell 7 has been installed there are various configurations which
# should be available to customise the behaviour of how Powershell 7 behaves
#
# @api private
#
class powershell7::config {
  case $facts['operatingsystem'] {
    'windows': {
      $microsoft_powershell_profile_path = 'C:/Program Files/PowerShell/7/Microsoft.PowerShell_profile.ps1'
      registry_value { 'HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment\POWERSHELL_UPDATECHECK':
        ensure => present,
        type   => string,
        data   => $powershell7::powershell_updatecheck,
      }
    }
    'Ubuntu': {
      $microsoft_powershell_profile_path = '/opt/microsoft/powershell/7/Microsoft.PowerShell.Profile.ps1'
    }
    default: { }
  }

  # All Users, Current Host profile
  file { $microsoft_powershell_profile_path:
    ensure  => file,
    content => epp('powershell7/Microsoft.PowerShell_profile.ps1.epp', {
      'window_width'     => $powershell7::config_window_width,
      'window_height'    => $powershell7::config_window_height,
      'buffer_height'    => $powershell7::config_buffer_height,
      'background_color' => $powershell7::config_background_color,
      'foreground_color' => $powershell7::config_foreground_color,
    })
  }
}
