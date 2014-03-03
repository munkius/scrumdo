require 'spec_helper'

describe ScrumDo::Model::Iteration do

  let(:iteration) { ScrumDo::Model::Project.new.iterations.first }

  it "has an index" do
    iteration.index.should eq 1
  end

  it "has a number of days" do
    iteration.days.should eq 35
  end

  it "has stories" do
    stories = iteration.stories
    stories.count.should eq 3
    story = stories.first

    story.number.should eq 58
    story.rank.should eq 7336
    story.id.should eq 11111
    story.category.should eq ''
    story.points_value.should eq 20
    story.detail_html.should eq '<p>some detail information</p>'
    story.summary_html.should eq '<p>Backlog item summary</p>'
    story.status_text.should eq 'Todo'
  end

  it "has burndown data" do
    burndown_data = iteration.burndown_data
    burndown_data.count.should eq 19

    burndown_day = burndown_data.first
    burndown_day.date.should eq Date.new(2013,12,10)
    burndown_day.points_total.should eq 36
    burndown_day.points.should eq({
      points_status1: 26,
      points_status2: 0,
      points_status3: 0,
      points_status4: 10,
      points_status5: 0,
      points_status6: 0,
      points_status7: 0,
      points_status8: 0,
      points_status9: 0,
      points_status10: 0
    })
  end

  it "has a burndown" do
    burndown = iteration.burndown
    burndown.count.should eq iteration.days

    burndown[0].should eq({date: Date.new(2013,12,10), todo: 36})
    burndown[1].should eq({date: Date.new(2013,12,11), todo: 36})
    burndown[2].should eq({date: Date.new(2013,12,12), todo: 36})
    burndown[3].should eq({date: Date.new(2013,12,13), todo: 31})
    burndown[4].should eq({date: Date.new(2013,12,14), todo: 31})
    burndown[5].should eq({date: Date.new(2013,12,15), todo: 31})
    burndown[6].should eq({date: Date.new(2013,12,16), todo: 26})
    burndown[7].should eq({date: Date.new(2013,12,17), todo: 26})
    burndown[8].should eq({date: Date.new(2013,12,18), todo: 26})
    burndown[9].should eq({date: Date.new(2013,12,19), todo: 21})

    burndown[10].should eq({date: Date.new(2013,12,20), todo: 21})
    burndown[11].should eq({date: Date.new(2013,12,21), todo: 21})
    burndown[12].should eq({date: Date.new(2013,12,22), todo: 21})
    burndown[13].should eq({date: Date.new(2013,12,23), todo: 18})
    burndown[14].should eq({date: Date.new(2013,12,24), todo: 18})
    burndown[15].should eq({date: Date.new(2013,12,25), todo: 18})
    burndown[16].should eq({date: Date.new(2013,12,26), todo: 18})
    burndown[17].should eq({date: Date.new(2013,12,27), todo: 18})
    burndown[18].should eq({date: Date.new(2013,12,28), todo: 18})

    burndown[19].should eq({date: Date.new(2013,12,29), todo: nil})
    burndown[20].should eq({date: Date.new(2013,12,30), todo: nil})
    burndown[21].should eq({date: Date.new(2013,12,31), todo: nil})
    burndown[22].should eq({date: Date.new(2014,1,1), todo: nil})
    burndown[23].should eq({date: Date.new(2014,1,2), todo: nil})
    burndown[24].should eq({date: Date.new(2014,1,3), todo: nil})
    burndown[25].should eq({date: Date.new(2014,1,4), todo: nil})
    burndown[26].should eq({date: Date.new(2014,1,5), todo: nil})
    burndown[27].should eq({date: Date.new(2014,1,6), todo: nil})
    burndown[28].should eq({date: Date.new(2014,1,7), todo: nil})
    burndown[29].should eq({date: Date.new(2014,1,8), todo: nil})

    burndown[30].should eq({date: Date.new(2014,1,9), todo: nil})
    burndown[31].should eq({date: Date.new(2014,1,10), todo: nil})
    burndown[32].should eq({date: Date.new(2014,1,11), todo: nil})
    burndown[33].should eq({date: Date.new(2014,1,12), todo: nil})
    burndown[34].should eq({date: Date.new(2014,1,13), todo: nil})
  end
end
