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
    command => "C:\\Windows\System32\\msiexec.exe /package ${download_dir}\\${file_name} /quiet ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1 ADD_FILE_CONTEXT_MENU_RUNPOWERSHELL=1 ENABLE_PSREMOTING=1 REGISTER_MANIFEST=1",
    creates => 'C:\\Program Files\\PowerShell\\7\\powershell.exe',
    require => File['powershell7-download'],
  }
}
