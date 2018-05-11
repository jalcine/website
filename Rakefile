# frozen_string_literal: true

require 'rake'
require 'fileutils'
require 'dotenv'

def run_jekyll(args = [])
  command = 'bundle exec jekyll' + ' ' + args.join(' ')
  puts system(command)
end

def run_jekyll_in_dev(args = [])
  run_jekyll(args + ['--config', '_config.yml,_config.dev.yml', '--trace'])
end

def run_jekyll_in_prod(args = [])
  run_jekyll(args + ['--destination', './_deploy'])
end

task :serve do
  system 'bundle exec jekyll serve'
end

namespace :build do
  task :watch do
    run_jekyll_in_dev(['build', '--watch'])
  end

  task :prod do
    run_jekyll_in_prod(['build'])
  end

  task :dev do
    run_jekyll_in_dev(['build', '--verbose'])
  end

  task :deploy do
    puts "----> Building for #{ENV['ENV']}"
    puts Rake::Task['build:prod'].invoke if ENV['ENV'] == 'production'
    puts Rake::Task['build:dev'].invoke unless ENV['ENV'] == 'production'
  end
end

task :notify do
  ['notify:pingomatic', 'notify:google', 'notify:webmention'].each do |task|
    Rake::Task[task].invoke
  end if ENV["ENV"] == 'production'
end

# TODO: Move into a separate Rake file.
desc 'Notify various services that the site has been updated'
namespace :notify do
  desc 'Notify Ping-O-Matic'
  task :pingomatic do
    begin
      require 'xmlrpc/client'
      puts '* Notifying Ping-O-Matic that the site has updated'
      client = XMLRPC::Client.new('rpc.pingomatic.com', '/')
      client.call('weblogUpdates.extendedPing', 'jacky.wtf',
                  '//jacky.wtf', '//jacky.wtf/atom.xml')
    rescue LoadError
      puts '! Could not ping ping-o-matic, because XMLRPC::Client could not be found.'
    end
  end

  desc 'Notify Google of updated sitemap'
  task :google do
    begin
      require 'net/http'
      require 'cgi'
      puts '* Notifying Google that the site has updated'
      uri = CGI.escape('//jacky.wtf/sitemap.xml')
      Net::HTTP.get('www.google.com', '/webmasters/tools/ping?sitemap=' + uri)
    rescue LoadError
      puts '! Could not ping Google about our sitemap, because Net::HTTP or URI could not be found.'
    end
  end

  desc 'Notify the IndieWeb'
  task :webmention do
    FileUtils.mkdir_p "#{ENV['PWD']}.cache/webmention"
    puts '* Notifying webmention.io'
    puts system('bundle exec jekyll webmention')
  end
end

if ENV['ENV'] == 'test'
  require 'rspec/core/rake_task'
  require 'html-proofer'

  RSpec::Core::RakeTask.new(:spec) do |t|
    t.pattern = Dir.glob('spec/**/*_spec.rb')
    t.rspec_opts = '--format doc'
  end

  task :html_proofer do
    HTMLProofer.check_directory('./_site',
      parallel: {
        in_processes: 4
      },
      cache: {
        timeframe: '30d'
      }
    ).run
  end
end

task default: %w[spec build:watch]
