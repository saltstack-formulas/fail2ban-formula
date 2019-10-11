# frozen_string_literal: true

control 'Fail2ban package' do
  title 'should be installed'

  describe package('fail2ban') do
    it { should be_installed }
  end
end
