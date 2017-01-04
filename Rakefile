require 'rake'
require 'fileutils'

task default: %w[clean build:drafts serve]

task :clean do
  FileUtils.rmdir('deploy', verbose: true)
end

task :build do
  system 'bin/jekyll build --verbose'
end

task :'build:deploy' do
  system 'ENV=production bin/jekyll build --verbose -d _deploy'
end

task :'build:drafts' do
  system 'bin/jekyll build --drafts --future --verbose --incremental'
end

task :serve do
  system 'bin/jekyll serve'
end

task :deploy do
  system 'bin/mina deploy --verbose --trace'
end
