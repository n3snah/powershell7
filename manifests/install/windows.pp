# powershell7::install::windows
#
# @summary Install Powershell 7 on Windows systems
#
# This class handles the installation of PowerShell 7 on supported windows systems.
#
# @api private
#
class powershell7::install::windows {
  $os_letter = $powershell7::os_letter
  $download_dir = $powershell7::download_dir
  $explorer_context_menu = $powershell7::add_explorer_context_menu_openpowershell
  $file_context_menu = $powershell7::add_file_context_menu_runpowershell
  $enable_psremoting = $powershell7::enable_psremoting
  $register_manifest = $powershell7::register_manifest

  case $powershell7::release_type {
    'lts': {
      $file_name = $powershell7::lts_file_name
      $source = $powershell7::lts_source_url
    }
    'stable': {
      $file_name = $powershell7::stable_file_name
      $source = $powershell7::stable_source_url
    }
    'preview': {
      $file_name = $powershell7::preview_file_name
      $source = $powershell7::preview_source_url
    }
    default: {
      $file_name = $powershell7::stable_file_name
      $source = $powershell7::stable_source_url
    }
  }

  file { 'powershell7-download':
    ensure => 'file',
    path   => "${download_dir}\\${file_name}",
    source => $source,
  }

  exec { 'powershell7-install':
    command => "${os_letter}:\\Windows\\System32\\msiexec.exe /package ${download_dir}\\${file_name} /quiet ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=${explorer_context_menu} ADD_FILE_CONTEXT_MENU_RUNPOWERSHELL=${file_context_menu} ENABLE_PSREMOTING=${enable_psremoting} REGISTER_MANIFEST=${register_manifest}", # lint:ignore:140chars
    creates => "${os_letter}:\\Program Files\\PowerShell\\7\\pwsh.exe",
    require => File['powershell7-download'],
  }
}
