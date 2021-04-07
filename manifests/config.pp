# @summary Configuration options for Powershell 7 once installed
#
# Once Powershell 7 has been installed there are various configurations which
# should be available to customise the behaviour of how Powershell 7 behaves
#
# @api private
#
class powershell7::config {
  registry_value { 'HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment\POWERSHELL_UPDATECHECK':
    ensure => present,
    type   => string,
    data   => $powershell7::powershell_updatecheck,
  }
}
