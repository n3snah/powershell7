# frozen_string_literal: true

require 'spec_helper'

describe 'powershell7::install', type: :class do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      let(:pre_condition) { 'include powershell7' }

      it { is_expected.to compile }

      it do
        is_expected.to contain_class('powershell7::install')
      end

      case os_facts[:osfamily]
      when 'windows'
        it do
          is_expected.to contain_class('powershell7::install::windows')
        end
      else
      end
    end
  end
end
