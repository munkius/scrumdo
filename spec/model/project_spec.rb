require 'spec_helper'

describe ScrumDo::Model::Project do

  let(:project) { ScrumDo::Model::Project.new }

  it "has a name" do
    project.velocity.should eq 42
    project.point_scale.should eq %w(? 0 0.5 1 2 3 5 8 13 20 40 100 infinite)
  end

  it "has iterations" do
    project.iterations.count.should eq 2

    iteration = project.iterations.first
    iteration.name.should eq 'Sprint 1'
    iteration.url.should eq '/projects/project/foo/iteration/22222'
    iteration.id.should eq 22222
    iteration.start_date.should eq Date.new(2013,12,10)
    iteration.end_date.should eq Date.new(2014,1,13)
  end

  it "has a backlog" do
    backlog = project.backlog
    backlog.id.should eq 11111
    backlog.stories.count.should eq 2
  end

  it "has members" do
    project.members.count.should eq 3

    member = project.members[1]
    member.username.should eq 'munkius'
    member.first_name.should eq 'Sander'
    member.last_name.should eq 'Nieuwenhuizen'
    member.email.should eq 'sander@doe.com'
    member.id.should eq 33333
  end

  it "has a current iteration" do
    Timecop.freeze(Date.new(2014,1,1)) do
      project.current_iteration.id.should eq 22222
    end
  end

  it "has iterations left" do
    Timecop.freeze(Date.new(2014,1,1)) do
      iterations = project.iterations_left.map(&:id).should eq [33333]
    end
  end

end
