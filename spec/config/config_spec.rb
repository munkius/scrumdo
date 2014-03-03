require 'spec_helper'

describe ScrumDo::Config::Configuration do

  let(:config) { ScrumDo::Config::Configuration }

  it "loads the properties" do
    config.organization.should eq 'org'
    config.project.should eq 'foo'
    config.proxy_host.should eq '127.0.0.1'
    config.proxy_port.should eq 8888
    config.user.should eq 'user'
    config.password.should eq 'password'
  end

end
