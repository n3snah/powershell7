# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @param download_dir
# @param add_explorer_context_menu_openpowershell
# @param add_file_context_menu_runpowershell
# @param enable_psremoting
# @param register_manifest
#
# @example
#   include powershell7
class powershell7(
  Stdlib::Absolutepath $download_dir                     = 'C:\\Windows\\Temp',
  Integer[0,1] $add_explorer_context_menu_openpowershell = 1,
  Integer[0,1] $add_file_context_menu_runpowershell      = 1,
  Integer[0,1] $enable_psremoting                        = 1,
  Integer[0,1] $register_manifest                        = 1,
) {
  contain powershell7::install
}
