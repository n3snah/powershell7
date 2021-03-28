# frozen_string_literal: true

require 'spec_helper'

describe 'powershell7' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }

      it do
        is_expected.to contain_class('powershell7::install')
      end
    end
  end
end
