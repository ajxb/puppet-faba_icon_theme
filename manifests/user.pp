# faba_icon_theme::user
#
# Enable Faba-Mono icon theme for the provided user
#
# @param user_name The user account for which to enable the Faba-Mono icon theme
define faba_icon_theme::user (
  String $user_name = $name,
) {
  require faba_icon_theme::install

  exec { "Enable Faba-Mono as desktop icon theme for ${user_name}":
    command => 'dbus-launch gsettings set org.gnome.desktop.interface icon-theme \'Faba-Mono\'',
    unless  => 'dbus-launch gsettings get org.gnome.desktop.interface icon-theme | grep \'Faba-Mono\'',
    user    => $user_name,
    path    => [
      '/bin',
      '/usr/bin'
    ],
    require => User[$user_name],
  }
}