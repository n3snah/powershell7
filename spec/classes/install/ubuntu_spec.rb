# frozen_string_literal: true

require 'spec_helper'

describe 'powershell7::install::ubuntu', type: :class do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      let(:pre_condition) { 'include powershell7' }

      it { is_expected.to compile }

      it do
        is_expected.to contain_class('powershell7::install::ubuntu')
      end

      case os_facts[:operatingsystem]
      when 'Ubuntu'
        #it do
        #  is_expected.to contain_file('packages-microsoft-prod.deb').with(
        #    'ensure' => 'file',
        #    'path' => '/tmp/packages-microsoft-prod.deb',
        #    'source' => 'https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb',
        #  )
        #end
        #it do
        #  is_expected.to contain_package('packages-microsoft-prod.deb').with(
        #    'ensure' => 'installed',
        #    'source' => '/tmp/packages-microsoft-prod.deb',
        #    'provider' => 'dpkg',
        #    'notify' => 'Exec[apt_update]',
        #  )
        #end
        it do
          is_expected.to contain_exec('apt_update')
        end
        it do
          is_expected.to contain_package('powershell').with(
            'ensure' => 'present',
            'require' => 'Exec[apt_update]',
          )
        end
      end
    end
  end
end
