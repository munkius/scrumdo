require 'spec_helper'

describe ScrumDo::Model::Story do

  let(:story) { ScrumDo::Model::Project.new.iterations.first.stories.first }

  it "has tasks" do
    tasks = story.tasks
    tasks.count.should eq 5

    task = tasks.first
    task.id.should eq 11111
    task.complete.should be_false
    task.summary.should eq 'Defect fixing & reviewing'
    task.estimated_minutes.should eq 0
    task.order.should eq 1
  end

end
