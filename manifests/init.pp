# powershell7
#
# @summary This is the powershell7 module main class
#
# This class declares all module parameters and calls the necessary classes
# to install PowerShell 7
#
# @param download_dir
#   The directory where the downloaded installer is placed.
# @param lts_file_name
#   The name of the LTS PowerShell installer
# @param lts_source_url
#   The internet URL for the LTS Powershell Download
# @param stable_file_name
#   The name of the Stable PowerShell installer
# @param stable_source_url
#   The internet URL for the Stable Powershell Download
# @param preview_file_name
#   The name of the Preview PowerShell installer
# @param preview_source_url
#   The internet URL for the Preview Powershell Download
# @param release_type
#   Defines which PowerShell release type to be installed. Defaults to stable
# @param add_explorer_context_menu_openpowershell
#   Adds a context menu item for explorer and will open a PowerShell window at the current location. Defaults to 1
# @param add_file_context_menu_runpowershell
#   Adds a context menu item to run the selected file in PowerShell. Defaults to 1
# @param enable_psremoting
#   Enables PS Remoting during installation. Defaults to 1
# @param register_manifest
#   Enables the Windows Event Logging Manifest. Defaults to 1
# @param powershell_updatecheck Sets the update notification policy to alert users to the availability of updates. Defaults to 'Default'
#
# @example
#   include powershell7
class powershell7 (
  Stdlib::Absolutepath $download_dir,
  String $lts_file_name,
  Stdlib::HTTPUrl $lts_source_url,
  String $stable_file_name,
  Stdlib::HTTPUrl $stable_source_url,
  String $preview_file_name,
  Stdlib::HTTPUrl $preview_source_url,
  ENUM['lts','stable','preview'] $release_type,
  Integer[0,1] $add_explorer_context_menu_openpowershell,
  Integer[0,1] $add_file_context_menu_runpowershell,
  Integer[0,1] $enable_psremoting,
  Integer[0,1] $register_manifest,
  ENUM['Off','Default','LTS'] $powershell_updatecheck,
) {
  contain powershell7::install
  contain powershell7::config

  Class['::powershell7::install']
  -> Class['::powershell7::config']
}
