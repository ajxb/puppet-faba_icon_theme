# faba_icon_theme::config
#
# Configures the faba icon theme as system default
#
# @param [String] package_ensure Specifies whether to install the faba-icon-theme and faba-mono-icons packages
# @param [String] user           Mandatory parameter that specifies the user to configure the font for
class faba_icon_theme::config (
  String $package_ensure = $faba_icon_theme::params::package_ensure,
  String $user = $faba_icon_theme::params::user,
) inherits faba_icon_theme::params {
  assert_type(String[1], $package_ensure)
  assert_type(String[1], $user)

  # Configure variables for the given desktop
  # Defaults assume a Ubuntu installation with Gnome / Unity desktop which can
  # be overridden using custom fact desktop.type
  if ($facts['desktop'] != undef and $facts['desktop']['type'] != undef) {
    case $facts['desktop']['type'] {
      'cinnamon': {
        $schema = 'org.cinnamon.desktop.interface'
        $default_iconset = '\'Mint-X\''
      }
      default:    {
        fail("Desktop ${facts['desktop']['type']} is not supported")
      }
    }
  } else {
    $schema = 'org.gnome.desktop.interface'
    $default_iconset = '\'ubuntu-mono-dark\''
  }

  if ($package_ensure == 'absent') or ($package_ensure == 'purged') {
    gnome::gsettings { 'desktop.interface_icon-theme':
      schema => $schema,
      key    => 'icon-theme',
      value  => $default_iconset,
      user   => $user,
    }
  } else {
    gnome::gsettings { 'desktop.interface_icon-theme':
      schema => $schema,
      key    => 'icon-theme',
      value  => '\'Faba-Mono\'',
      user   => $user,
    }
  }
}
