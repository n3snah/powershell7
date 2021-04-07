# frozen_string_literal: true

require 'spec_helper'

describe 'powershell7', type: :class do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }

      it do
        is_expected.to contain_class('powershell7::install')
      end

      it do
        is_expected.to contain_class('powershell7::config')
      end

      context 'with defaults and release_type => stable' do
        let :params do
          {
            release_type: 'lts',
          }
        end

        it do
          is_expected.to contain_file('powershell7-download').with(
            'ensure' => 'file',
            'path' => 'C:\\Windows\\Temp\\PowerShell-7.0.6-win-x64.msi',
            'source' => 'https://github.com/PowerShell/PowerShell/releases/download/v7.0.6/PowerShell-7.0.6-win-x64.msi',
          )
        end

        it do
          is_expected.to contain_exec('powershell7-install').with(
            # rubocop:disable LineLength
            'command' => 'C:\\Windows\\System32\\msiexec.exe /package C:\\Windows\\Temp\\PowerShell-7.0.6-win-x64.msi /quiet ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1 ADD_FILE_CONTEXT_MENU_RUNPOWERSHELL=1 ENABLE_PSREMOTING=1 REGISTER_MANIFEST=1',
            # rubocop:enable LineLength
            'creates' => 'C:\\Program Files\\PowerShell\\7\\pwsh.exe',
            'require' => 'File[powershell7-download]',
          )
        end

        context 'and add_explorer_context_menu_openpowershell => 0' do
          let :params do
            super().merge(
              {
                add_explorer_context_menu_openpowershell: 0,
              },
            )
          end

          it do
            is_expected.to contain_exec('powershell7-install').with(
              # rubocop:disable LineLength
              'command' => 'C:\\Windows\\System32\\msiexec.exe /package C:\\Windows\\Temp\\PowerShell-7.0.6-win-x64.msi /quiet ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=0 ADD_FILE_CONTEXT_MENU_RUNPOWERSHELL=1 ENABLE_PSREMOTING=1 REGISTER_MANIFEST=1',
              # rubocop:enable LineLength
              'creates' => 'C:\\Program Files\\PowerShell\\7\\pwsh.exe',
              'require' => 'File[powershell7-download]',
            )
          end
        end

        context 'and add_file_context_menu_runpowershell => 0' do
          let :params do
            super().merge(
              {
                add_file_context_menu_runpowershell: 0,
              },
            )
          end

          it do
            is_expected.to contain_exec('powershell7-install').with(
              # rubocop:disable LineLength
              'command' => 'C:\\Windows\\System32\\msiexec.exe /package C:\\Windows\\Temp\\PowerShell-7.0.6-win-x64.msi /quiet ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1 ADD_FILE_CONTEXT_MENU_RUNPOWERSHELL=0 ENABLE_PSREMOTING=1 REGISTER_MANIFEST=1',
              # rubocop:enable LineLength
              'creates' => 'C:\\Program Files\\PowerShell\\7\\pwsh.exe',
              'require' => 'File[powershell7-download]',
            )
          end
        end

        context 'and enable_psremoting => 0' do
          let :params do
            super().merge(
              {
                enable_psremoting: 0,
              },
            )
          end

          it do
            is_expected.to contain_exec('powershell7-install').with(
              # rubocop:disable LineLength
              'command' => 'C:\\Windows\\System32\\msiexec.exe /package C:\\Windows\\Temp\\PowerShell-7.0.6-win-x64.msi /quiet ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1 ADD_FILE_CONTEXT_MENU_RUNPOWERSHELL=1 ENABLE_PSREMOTING=0 REGISTER_MANIFEST=1',
              # rubocop:enable LineLength
              'creates' => 'C:\\Program Files\\PowerShell\\7\\pwsh.exe',
              'require' => 'File[powershell7-download]',
            )
          end
        end

        context 'and register_manifest => 0' do
          let :params do
            super().merge(
              {
                register_manifest: 0,
              },
            )
          end

          it do
            is_expected.to contain_exec('powershell7-install').with(
              # rubocop:disable LineLength
              'command' => 'C:\\Windows\\System32\\msiexec.exe /package C:\\Windows\\Temp\\PowerShell-7.0.6-win-x64.msi /quiet ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1 ADD_FILE_CONTEXT_MENU_RUNPOWERSHELL=1 ENABLE_PSREMOTING=1 REGISTER_MANIFEST=0',
              # rubocop:enable LineLength
              'creates' => 'C:\\Program Files\\PowerShell\\7\\pwsh.exe',
              'require' => 'File[powershell7-download]',
            )
          end
        end
      end

      context 'with defaults and release_type => stable' do
        let :params do
          {
            release_type: 'stable',
          }
        end

        it do
          is_expected.to contain_file('powershell7-download').with(
            'ensure' => 'file',
            'path' => 'C:\\Windows\\Temp\\PowerShell-7.1.3-win-x64.msi',
            'source' => 'https://github.com/PowerShell/PowerShell/releases/download/v7.1.3/PowerShell-7.1.3-win-x64.msi',
          )
        end

        it do
          is_expected.to contain_exec('powershell7-install').with(
            # rubocop:disable LineLength
            'command' => 'C:\\Windows\\System32\\msiexec.exe /package C:\\Windows\\Temp\\PowerShell-7.1.3-win-x64.msi /quiet ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1 ADD_FILE_CONTEXT_MENU_RUNPOWERSHELL=1 ENABLE_PSREMOTING=1 REGISTER_MANIFEST=1',
            # rubocop:enable LineLength
            'creates' => 'C:\\Program Files\\PowerShell\\7\\pwsh.exe',
            'require' => 'File[powershell7-download]',
          )
        end
      end

      context 'with defaults and release_type => preview' do
        let :params do
          {
            release_type: 'preview',
          }
        end

        it do
          is_expected.to contain_file('powershell7-download').with(
            'ensure' => 'file',
            'path' => 'C:\\Windows\\Temp\\PowerShell-7.2.0-win-x64.msi',
            'source' => 'https://github.com/PowerShell/PowerShell/releases/download/v7.2.0-preview.4/PowerShell-7.2.0-preview.4-win-x64.msi',
          )
        end

        it do
          is_expected.to contain_exec('powershell7-install').with(
            # rubocop:disable LineLength
            'command' => 'C:\\Windows\\System32\\msiexec.exe /package C:\\Windows\\Temp\\PowerShell-7.2.0-win-x64.msi /quiet ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1 ADD_FILE_CONTEXT_MENU_RUNPOWERSHELL=1 ENABLE_PSREMOTING=1 REGISTER_MANIFEST=1',
            # rubocop:enable LineLength
            'creates' => 'C:\\Program Files\\PowerShell\\7\\pwsh.exe',
            'require' => 'File[powershell7-download]',
          )
        end
      end

      context 'with powershell_updatecheck => Default' do
        let :params do
          {
            powershell_updatecheck: 'Default',
          }
        end

        it do
          is_expected.to contain_registry_value('HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment\POWERSHELL_UPDATECHECK')
            .with_data('Default')
        end
      end

      context 'with powershell_updatecheck => Off' do
        let :params do
          {
            powershell_updatecheck: 'Off',
          }
        end

        it do
          is_expected.to contain_registry_value('HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment\POWERSHELL_UPDATECHECK')
            .with_data('Off')
        end
      end

      context 'with powershell_updatecheck => LTS' do
        let :params do
          {
            powershell_updatecheck: 'LTS',
          }
        end

        it do
          is_expected.to contain_registry_value('HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment\POWERSHELL_UPDATECHECK')
            .with_data('LTS')
        end
      end
    end
  end
end
