# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

require 'bundler/setup'
require 'rubydoop/package'

namespace :hadoop do
  task :generate_package do
    job_package = Rubydoop::Package.new
    job_package.create!
  end
end
