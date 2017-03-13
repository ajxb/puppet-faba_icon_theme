# Class: faba_icon_theme
#
# Manage installation and configuration of the Faba-Mono icon theme on Ubuntu, installing from ppa
#
# @example Declaring the class
#   include faba_icon_theme
# @example Declaring the class with parameters
#   class { 'faba_icon_theme':
#     package_ensure => true,
#   }
#
# @param package_ensure Specifies whether to install the faba-icon-theme and faba-mono-icons packages
class faba_icon_theme (
  String  $package_ensure = $faba_icon_theme::params::package_ensure,
) inherits faba_icon_theme::params {

  class { 'faba_icon_theme::install':
    package_ensure => $package_ensure,
  }

  class { 'faba_icon_theme::config':
    package_ensure => $package_ensure,
  }

  contain faba_icon_theme::install
  contain faba_icon_theme::config

  Class['faba_icon_theme::install']
    -> Class['faba_icon_theme::config']
}
