require 'spec_helper'

describe 'faba_icon_theme::config' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end

      context 'configure faba with defaults' do
        it do
          should contain_gnome__gsettings('org.gnome.desktop.interface').with(
            schema: 'org.gnome.desktop.interface',
            key:    'icon-theme',
            value:  '"Faba-Mono"'
          )
        end
      end

      context 'remove faba icon theme' do
        let :params do
          {
            package_ensure: 'absent'
          }
        end

        it do
          should contain_gnome__gsettings('org.gnome.desktop.interface').with(
            schema: 'org.gnome.desktop.interface',
            key:    'icon-theme',
            value:  '"ubuntu-mono-dark"'
          )
        end
      end
    end
  end
end
