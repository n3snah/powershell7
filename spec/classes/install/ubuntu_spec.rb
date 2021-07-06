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
        case os_facts[:operatingsystemmajrelease]
        when '18.04'
          it do
            is_expected.to contain_apt__source('microsoft-prod').with(
              'location' => 'https://packages.microsoft.com/ubuntu/18.04/prod',
              'repos' => 'main',
              'key' => {
                'id' => 'BC528686B50D79E339D3721CEB3E94ADBE1229CF',
                'server' => 'pgp.mit.edu',
              },
              'notify' => 'Exec[apt_update]',
            )
          end
        when '20.04'
          it do
            is_expected.to contain_apt__source('microsoft-prod').with(
              'location' => 'https://packages.microsoft.com/ubuntu/20.04/prod',
              'repos' => 'main',
              'key' => {
                'id' => 'BC528686B50D79E339D3721CEB3E94ADBE1229CF',
                'server' => 'pgp.mit.edu',
              },
              'notify' => 'Exec[apt_update]',
            )
          end
        end

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
