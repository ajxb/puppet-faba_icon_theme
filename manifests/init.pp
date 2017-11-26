# Class: faba_icon_theme
#
# Manage installation and configuration of the Faba-Mono icon theme on Ubuntu, installing from ppa
#
# @example Declaring the class
#   class { 'faba_icon_theme':
#     user => 'theuser',
#   }
#
# @param [String] package_ensure Specifies whether to install the faba-icon-theme and faba-mono-icons packages
# @param [String] user           Mandatory parameter that specifies the user to configure the font for
class faba_icon_theme (
  String $package_ensure = $faba_icon_theme::params::package_ensure,
  String $user = $faba_icon_theme::params::user,
) inherits faba_icon_theme::params {
  assert_type(String[1], $package_ensure)
  assert_type(String[1], $user)

  class { 'faba_icon_theme::install':
    package_ensure => $package_ensure,
  }

  class { 'faba_icon_theme::config':
    package_ensure => $package_ensure,
    user           => $user,
  }

  contain faba_icon_theme::install
  contain faba_icon_theme::config

  Class['faba_icon_theme::install']
    -> Class['faba_icon_theme::config']
}
