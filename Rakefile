require 'rake'
require 'fileutils'

task default: %w[clean build:drafts serve]

task :clean do
  FileUtils.rmdir('deploy', verbose: true)
end

task :build do
  system 'bin/jekyll build --verbose -d _deploy'
end

task :'build:drafts' do
  system 'bin/jekyll build --drafts --future --verbose'
end

task :serve do
  system 'bin/jekyll serve'
end

task :deploy do
  system 'bin/mina deploy -f config/mina.rb'
end
