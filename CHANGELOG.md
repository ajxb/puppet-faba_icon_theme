## 2017-11-25 Release 1.2.0
### Summary :

* Update to provide handling for cinnamon desktop

## 2017-03-13 Release 1.1.0
### Summary :

This is a breaking change, faba_icon_theme::user has been removed to use global settings.

* Update to use [camptocamp/gnome](https://github.com/camptocamp/puppet-gnome) module for global configuration of icon theme in place of user specific configuration
* Removed faba_icon_theme::user class
* Update to reset configuration to Ubuntu defaults when packages are removed

## 2017-03-05 Release 1.0.0
### Summary :

* Initial release of faba_icon_theme module
