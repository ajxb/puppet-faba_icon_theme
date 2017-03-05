# faba_icon_theme::params
#
# Handles the module default parameters
#
class faba_icon_theme::params {

  case $facts['operatingsystem'] {
    'Ubuntu': {
      $package_ensure = 'latest'
    }
    default: {
      fail("${facts['operatingsystem']} not supported")
    }
  }
}
