# frozen_string_literal: true

require 'spec_helper'

describe 'powershell7::config' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }

      it do
        is_expected.to contain_registry_value('HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment\POWERSHELL_UPDATECHECK')
          .with_ensure('present')
          .with_type('string')
      end
    end
  end
end
