# powershell7
#
# @summary This is the powershell7 module main class
#
# This class declares all module parameters and calls the necessary classes
# to install PowerShell 7
#
# @param os_letter
#   The Letter of the disk which has the Windows folder. Defaults to C
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
# @param powershell_updatecheck
#   Sets the update notification policy to alert users to the availability of updates. Defaults to 'Default'
# @param config_window_width
#   Sets the width of the PowerShell window. This also needs to set the Buffer width also as they can't be different. Defaults to 120
# @param config_window_height
#   Sets the height of the PowerShell window. Defaults to 30
# @param config_buffer_height
#   Sets how far you can vertically scroll the window to see previous commands and output. Defaults to 9001
# @param config_background_color
#   Sets the color of the window behind the text. Defaults to 'Black'
# @param config_foreground_color
#   Sets the color of the foreground text color. Defaults to 'White'
# @param apt_repository
#   Sets the Apt Repository location for downloading PowerShell on Linux. Defaults to official Microsoft repository
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
#
# @example Basic usage
#   include powershell7
#
# @example Configuring window defaults
#   class { 'powershell7':
#     config_window_width     => 400,
#     config_window_height    => 60,
#     config_buffer_height    => 6000,
#     config_background_color => 'Blue',
#     config_foreground_color => 'White',
#   }
#
# @example Using a different download location and version of the installer
#   class {
#     lts_file_name  => 'PowerShell-7.0.6-win-x64.msi',
#     lts_source_url => 'https://myserver.internal.com/PowerShell/PowerShell-7.0.6-win-x64.msi',
#   }
#
class powershell7 (
  ENUM['lts','stable','preview'] $release_type,
  Integer[0,1] $add_explorer_context_menu_openpowershell,
  Integer[0,1] $add_file_context_menu_runpowershell,
  Integer[0,1] $enable_psremoting,
  Integer[0,1] $register_manifest,
  ENUM['Off','Default','LTS'] $powershell_updatecheck,
  Integer $config_window_width,
  Integer $config_window_height,
  Integer $config_buffer_height,
  Powershell7::Windowcolor $config_background_color,
  Powershell7::Windowcolor $config_foreground_color,
  Optional[Stdlib::HTTPUrl] $apt_repository              = undef,
  Optional[Stdlib::Absolutepath] $download_dir           = undef,
  Optional[String] $stable_file_name                     = undef,
  Optional[Stdlib::HTTPUrl] $stable_source_url           = undef,
  Optional[String] $preview_file_name                    = undef,
  Optional[Stdlib::HTTPUrl] $preview_source_url          = undef,
  Optional[Pattern[/^[A-Z]$/]] $os_letter                = undef,
  Optional[String] $lts_file_name                        = undef,
  Optional[Stdlib::HTTPUrl] $lts_source_url              = undef,

) {
  contain powershell7::install
  contain powershell7::config

  Class['::powershell7::install']
  -> Class['::powershell7::config']
}
