require 'spec_helper'

describe 'faba_icon_theme::user', type: :define do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let :facts do
        facts
      end

      let :title do
        'test_user'
      end

      it { is_expected.to contain_class('faba_icon_theme::install') }
      it { is_expected.to contain_faba_icon_theme__user('test_user') }
      it do
        is_expected.to contain_exec('Enable Faba-Mono as desktop icon theme for test_user').with(
          user:    'test_user',
          require: 'User[test_user]'
        )
      end
    end
  end
end
