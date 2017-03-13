require 'spec_helper'

describe 'faba_icon_theme::install' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end

      context 'configure the moka ppa' do
        it { should contain_apt__ppa('ppa:moka/daily') }
      end

      context 'install faba with defaults' do
        it { should contain_package('faba-icon-theme').with_ensure('latest') }
        it { should contain_package('faba-mono-icons').with_ensure('latest') }
      end

      context 'remove faba icon theme' do
        let :params do
          {
            package_ensure: 'absent'
          }
        end

        it { should contain_package('faba-icon-theme').with_ensure('absent') }
        it { should contain_package('faba-mono-icons').with_ensure('absent') }
      end

      it { should contain_apt__ppa('ppa:moka/daily').that_notifies('Class[apt::update]') }
      it { should contain_package('faba-icon-theme').that_requires('Class[apt::update]') }
      it { should contain_package('faba-mono-icons').that_requires('Class[apt::update]') }
    end
  end
end
