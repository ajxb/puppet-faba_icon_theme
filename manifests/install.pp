# faba_icon_theme::install
#
# Handles the ppa setup and the Faba-Mono icon theme packages
#
# @param package_ensure Specifies whether to install the faba-icon-theme and faba-mono-icons packages
class faba_icon_theme::install (
  String $package_ensure = $faba_icon_theme::params::package_ensure,
) inherits faba_icon_theme::params {
  include apt
  apt::ppa { 'ppa:moka/daily': }

  package { 'faba-icon-theme':
    ensure => $package_ensure,
  }

  package { 'faba-mono-icons':
    ensure => $package_ensure,
  }

  Apt::Ppa['ppa:moka/daily']
    ~> Class['apt::update']
    -> Package[ 'faba-icon-theme', 'faba-mono-icons' ]
}
