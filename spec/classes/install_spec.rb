# frozen_string_literal: true

require 'spec_helper'

describe 'powershell7::install' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }

      it do
        is_expected.to contain_file('powershell7-download').with(
          'ensure' => 'file',
          'path' => 'C:\\Windows\Temp\\PowerShell-7.1.3-win-x64.msi',
          'source' => 'https://github.com/PowerShell/PowerShell/releases/download/v7.1.3/PowerShell-7.1.3-win-x64.msi'
        )
      end

      it do
        is_expected.to contain_exec('powershell7-install').with(
          'command' => 'C:\\Windows\System32\\msiexec.exe /package C:\\Windows\Temp\\PowerShell-7.1.3-win-x64.msi /quiet ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1 ADD_FILE_CONTEXT_MENU_RUNPOWERSHELL=1 ENABLE_PSREMOTING=1 REGISTER_MANIFEST=1',
          'creates' => 'C:\\Program Files\\PowerShell\\7\\powershell.exe',
          'require' => 'File[powershell7-download]',
        )
      end
    end
  end
end
