require 'fakeweb'
require 'scrumdo'
require 'timecop'

FakeWeb.allow_net_connect = false

Dir[File.expand_path('../support/**/*.rb', __FILE__)].each { |f| load f }

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'

  config.before :all do
    register_fake_urls
  end

end

def register_fake_urls
  register_fake_url '/foo', 'project.json'
  register_fake_url '/foo/iterations', 'iterations.json'
  register_fake_url '/foo/members', 'members.json'
  register_fake_url '/foo/iterations/11111/stories', 'backlog_stories.json'
  register_fake_url '/foo/iterations/22222/stories', 'iteration_22222_stories.json'
  register_fake_url '/foo/iterations/22222/burndown', 'iteration_22222_burndown.json'
  register_fake_url '/foo/iterations/22222/stories/11111/tasks', 'iteration_22222_story_11111_tasks.json'
end

def register_fake_url(uri,fixture)
  FakeWeb.register_uri(:get, 'https://user:password@www.scrumdo.com/api/v2/organizations/org/projects%s' % uri, :body => File.open(File.expand_path('../fixtures/%s' % fixture, __FILE__), 'rb').read, status: 200)
end
