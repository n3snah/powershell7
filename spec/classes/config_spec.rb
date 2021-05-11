# frozen_string_literal: true

require 'spec_helper'

describe 'powershell7::config' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      let(:pre_condition) { 'include powershell7' }

      it { is_expected.to compile }

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
          .with_content(/\$WindowSize\.width=120/)
      end

      it do
        is_expected.to contain_file('C:/Program Files/PowerShell/7/Microsoft.PowerShell_profile.ps1')
          .with_content(/\$WindowSize\.height=30/)
      end

      it do
        is_expected.to contain_file('C:/Program Files/PowerShell/7/Microsoft.PowerShell_profile.ps1')
          .with_content(/\$BufferSize\.width=120/)
      end

      it do
        is_expected.to contain_file('C:/Program Files/PowerShell/7/Microsoft.PowerShell_profile.ps1')
          .with_content(/\$BufferSize\.height=9001/)
      end
    end
  end
end
