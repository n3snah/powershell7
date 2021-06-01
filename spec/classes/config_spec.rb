# frozen_string_literal: true

require 'spec_helper'

describe 'powershell7::config' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      let(:pre_condition) { 'include powershell7' }

      it { is_expected.to compile }

      it do
        is_expected.to contain_class('powershell7::config')
      end

      case os_facts[:osfamily]
      when 'windows'
        it do
          is_expected.to contain_registry_value('HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment\POWERSHELL_UPDATECHECK')
            .with_ensure('present')
            .with_type('string')
            .with_data('Default')
        end

        it do
          is_expected.to contain_file('C:/Program Files/PowerShell/7/Microsoft.PowerShell_profile.ps1').with_ensure('file')
        end

        it do
          is_expected.to contain_file('C:/Program Files/PowerShell/7/Microsoft.PowerShell_profile.ps1')
            .with_content(%r{\$WindowSize\.width=120})
        end

        it do
          is_expected.to contain_file('C:/Program Files/PowerShell/7/Microsoft.PowerShell_profile.ps1')
            .with_content(%r{\$WindowSize\.height=30})
        end

        it do
          is_expected.to contain_file('C:/Program Files/PowerShell/7/Microsoft.PowerShell_profile.ps1')
            .with_content(%r{\$BufferSize\.width=120})
        end

        it do
          is_expected.to contain_file('C:/Program Files/PowerShell/7/Microsoft.PowerShell_profile.ps1')
            .with_content(%r{\$BufferSize\.height=9001})
        end

        it do
          is_expected.to contain_file('C:/Program Files/PowerShell/7/Microsoft.PowerShell_profile.ps1')
            .with_content(%r{\$shell\.BackgroundColor = \"Black\"})
        end

        it do
          is_expected.to contain_file('C:/Program Files/PowerShell/7/Microsoft.PowerShell_profile.ps1')
            .with_content(%r{\$shell\.ForegroundColor = \"White\"})
        end
      else
      # add tests here to ensure they are not present
      end
    end
  end
end
