# powershell7
#
# @summary This is the powershell7 module main class
#
# This class declares all module parameters and calls the necessary classes
# to install PowerShell 7
#
# @param download_dir
# @param add_explorer_context_menu_openpowershell
# @param add_file_context_menu_runpowershell
# @param enable_psremoting
# @param register_manifest
#
# @example
#   include powershell7
class powershell7 (
  Stdlib::Absolutepath $download_dir,
  String $lts_file_name,
  Stdlib::HTTPSUrl $lts_source_url,
  String $stable_file_name,
  Stdlib::HTTPSUrl $stable_source_url,
  String $preview_file_name,
  Stdlib::HTTPSUrl $preview_source_url,
  ENUM['lts','stable','preview'] $release_type,
  Integer[0,1] $add_explorer_context_menu_openpowershell,
  Integer[0,1] $add_file_context_menu_runpowershell,
  Integer[0,1] $enable_psremoting,
  Integer[0,1] $register_manifest,
) {
  contain powershell7::install
}
