# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

namespace :test do
  desc "Send merged SimpleCov results to CodeClimate"
  ENV["CODECLIMATE_REPO_TOKEN"] = 549c22f4e2db072df829fc14ceaef0ac4db510d2896bff73517d4feb17a7d6cd
  Rake::TestTask.new("codeclimate") do |t|
    t.pattern = 'spec/spec_helper.rb'
    t.verbose = true
  end
end