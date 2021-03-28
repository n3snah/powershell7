# powershell7::install
# 
# @summary Install Powershell 7
#
# This class handles the installation of PowerShell 7 on the selected machine
#
# @api private
#
class powershell7::install {
  $download_dir = $powershell7::download_dir
  $file_name = 'PowerShell-7.1.3-win-x64.msi'

  file { 'powershell7-download':
    ensure => 'file',
    path   => "${download_dir}\\${file_name}",
    source => "https://github.com/PowerShell/PowerShell/releases/download/v7.1.3/${file_name}",
  }

  exec { 'powershell7-install':
    command => "C:\\Windows\System32\\msiexec.exe /package ${download_dir}\\${file_name} /quiet ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=${powershell7::add_explorer_context_menu_openpowershell} ADD_FILE_CONTEXT_MENU_RUNPOWERSHELL=${powershell7::add_file_context_menu_runpowershell} ENABLE_PSREMOTING=${powershell7::enable_psremoting} REGISTER_MANIFEST=${powershell7::register_manifest}",
    creates => 'C:\\Program Files\\PowerShell\\7\\powershell.exe',
    require => File['powershell7-download'],
  }
}
