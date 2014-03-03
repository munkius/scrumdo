require "scrumdo/version"

module ScrumDo
  module Config
    autoload :Configuration, 'scrumdo/config/configuration'
  end
  module Model
    autoload :BurndownDay, 'scrumdo/model/burndown_day'
    autoload :Iteration, 'scrumdo/model/iteration'
    autoload :Member, 'scrumdo/model/member'
    autoload :Project, 'scrumdo/model/project'
    autoload :Story, 'scrumdo/model/story'
    autoload :Task, 'scrumdo/model/task'
  end
  module Connector
    autoload :DataRetriever, 'scrumdo/connector/data_retriever'
  end
end
