require_relative 'spec_helper'

describe Player.new 'Thomas', '\u263A' do
  it { is_expected.to have_attributes(name: 'Thomas') }
  it { is_expected.to have_attributes(token: '\u263A') }
end
