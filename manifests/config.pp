# faba_icon_theme::config
#
# Configures the faba icon theme as system default
#
# @param package_ensure Specifies whether to install the faba-icon-theme and faba-mono-icons packages
class faba_icon_theme::config (
    String $package_ensure = $faba_icon_theme::params::package_ensure,
) inherits faba_icon_theme::params {
  if ($package_ensure == 'absent') or ($package_ensure == 'purged') {
    gnome::gsettings { 'org.gnome.desktop.interface':
      schema => 'org.gnome.desktop.interface',
      key    => 'icon-theme',
      value  => '"ubuntu-mono-dark"',
    }
  } else {
    gnome::gsettings { 'org.gnome.desktop.interface':
      schema => 'org.gnome.desktop.interface',
      key    => 'icon-theme',
      value  => '"Faba-Mono"',
    }
  }
}
