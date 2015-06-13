require 'spec_helper'

describe 'coreutils' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "coreutils class without any parameters" do
          let(:params) {{ }}

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('coreutils::params') }
          it { is_expected.to contain_class('coreutils::install').that_comes_before('coreutils::config') }
          it { is_expected.to contain_class('coreutils::config') }
          it { is_expected.to contain_class('coreutils::service').that_subscribes_to('coreutils::config') }

          it { is_expected.to contain_service('coreutils') }
          it { is_expected.to contain_package('coreutils').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'coreutils class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { is_expected.to contain_package('coreutils') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
