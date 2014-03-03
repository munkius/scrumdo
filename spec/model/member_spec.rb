require 'spec_helper'

describe ScrumDo::Model::Member do

  let(:members) { ScrumDo::Model::Project.new.members }

  it "has a name" do
    members.first.name.should eq 'John Doe'
  end

  it "falls back to the username when name is blank" do
    member = members.find do |member|
      member.first_name.empty?
    end

    member.name.should eq member.username
  end


end
