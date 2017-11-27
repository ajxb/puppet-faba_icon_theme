# faba_icon_theme

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with faba_icon_theme](#setup)
    * [What faba_icon_theme affects](#what-faba_icon_theme-affects)
    * [Beginning with faba_icon_theme](#beginning-with-faba_icon_theme)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

The faba_icon_theme module installs the [Faba-Mono icon theme](https://snwh.org/moka) from [ppa](https://launchpad.net/~moka/+archive/ubuntu/daily) on Ubuntu for both Gnome and Cinnamon based desktops.

## Setup

### What faba_icon_theme affects

* apt configuration to include Faba-Mono icon theme ppa
* gsettings to configure Faba-Mono icon theme for a specified user

### Dependencies

This module has a dependency on
[puppet-gnome](https://github.com/ajxb/puppet-gnome) which is not available on
Puppet Forge so will need to be downloaded and installed using your preferred
method, e.g. [librarian-puppet](http://librarian-puppet.com/)

### Beginning with faba_icon_theme

To install Faba-Mono icon theme:

```puppet
class { 'faba_icon_theme':
  package_ensure => 'latest',
  user           => 'ajxb',
}
```

## Usage

The default faba_icon_theme class installs faba-icon-theme and faba-mono-icons. To use:

```puppet
class { 'faba_icon_theme':
  package_ensure => 'latest',
  user           => 'ajxb',
}
```

To configure the Cinnamon desktop the following fact must be defined:
```yaml
desktop:
  type: cinnamon
```

## Reference

### Classes

#### Public classes

* `faba_icon_theme`: Installs faba-icon-theme and faba-mono-icons

#### Private classes

* `faba_icon_theme::config`: Handles the configuration of the theme
* `faba_icon_theme::params`: Handles the module default parameters
* `faba_icon_theme::install`: Handles the ppa setup and the Faba-Mono icon theme packages

### Parameters

The following parameters are available in the `faba_icon_theme` class:

#### `package_ensure`

Data type: String.

Whether to install the faba-icon-theme and faba-mono-icons packages. Values: The same as used for the puppet package type, see [https://docs.puppet.com/puppet/latest/type.html#package-attribute-ensure](https://docs.puppet.com/puppet/latest/type.html#package-attribute-ensure)

Default value: 'latest'.

#### `user`

Data type: String.

The username to configure the icon theme for.

Default value: 'latest'.

## Limitations

This module has only been tested against Ubuntu 16.04.  As the Faba-Mono icon theme is a desktop theme this module will only produce tangible results when used with a desktop variant of Ubuntu.

## Development

### Contributing

Before starting your work on this module, you should fork the project to your GitHub account. This allows you to freely experiment with your changes. When your changes are complete, submit a pull request. All pull requests will be reviewed and merged if they suit some general guidelines:

* Changes are located in a topic branch
* For new functionality, proper tests are written
* Changes should not solve certain problems on special environments
* Your change does not handle third party software for which dedicated Puppet modules exist
  * such as creating databases, installing webserver etc.
* Changes follow the recommended Puppet style guidelines from the [Puppet Language Style Guide](https://docs.puppet.com/puppet/latest/style_guide.html)

### Branches

Choosing a proper name for a branch helps us identify its purpose and possibly find an associated bug or feature. Generally a branch name should include a topic such as `bug` or `feature` followed by a description and an issue number if applicable. Branches should have only changes relevant to a specific issue.

```
git checkout -b bug/service-template-typo-1234
git checkout -b feature/config-handling-1235
```

### Running tests

This project contains tests for [rspec-puppet](http://rspec-puppet.com/) to verify functionality. For detailed information on using this tool, please see the relevant documentation.

#### Testing quickstart

```
gem install bundler
bundle install
rake spec
```
