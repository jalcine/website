require 'rake'
require 'fileutils'

task default: %w[clean build:dev]

task :clean do
  FileUtils.rmdir('_deploy', verbose: true)
end

task :build do
  system 'bin/jekyll build --verbose -d _deploy'
end

task :'build:drafts' do
  system 'bin/jekyll build --drafts --future --verbose'
end

task :deploy do
  Rake::Task[:clean].invoke
  Rake::Task[:build].invoke
  system 'bin/mina deploy'
end
