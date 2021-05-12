require 'spec_helper'

describe 'Powershell7::Windowcolor' do
  it do
    is_expected.to allow_values(
      'Black',
      'DarkBlue',
      'DarkGreen',
      'DarkCyan',
      'DarkRed',
      'DarkMagenta',
      'DarkYellow',
      'Gray',
      'Blue',
      'Green',
      'Cyan',
      'Red',
      'Magenta',
      'Yellow',
      'White',
    )
  end
  it do
    is_expected.not_to allow_value('Purple')
  end
end
