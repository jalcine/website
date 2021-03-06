# frozen_string_literal: true

require 'rake'
require 'fileutils'
require 'dotenv'

def run_jekyll(args = [])
  command = 'bundle exec jekyll' + ' ' + args.join(' ')
  puts "----> Running '#{command}'"
  puts system(command)
end

def run_jekyll_in_dev(args = [])
  run_jekyll(args + ['--config', '_config.yml,_config.dev.yml', '--trace'])
end

def run_jekyll_in_prod(args = [])
  run_jekyll(args + ['--destination', './_deploy', '--verbose', '--trace'])
end

task :serve do
  system 'bundle exec jekyll serve'
end

task :dev do
  run_jekyll_in_dev(['serve', '--livereload', '--trace', '--verbose'])
end

namespace :build do
  task :prod do
    puts '----> Creating cache directories...'
    FileUtils::mkdir_p '/tmp/build/src/.cache/webmention'
    run_jekyll_in_prod(['build'])
  end

  task :dev do
    puts "-----> Building a development release..."
    run_jekyll_in_dev(['build', '--verbose'])
    puts "-----> Built a development release."
  end

  task :deploy do
    puts "----> Building for #{ENV['ENV']}"
    puts Rake::Task['build:prod'].invoke if ENV['ENV'] == 'production'
    puts Rake::Task['build:dev'].invoke unless ENV['ENV'] == 'production'
    puts "----> Built site for #{ENV['ENV']}"
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
    puts '* Notifying webmention.io'
    puts system('bundle exec jekyll webmention')
  end
end

task default: %w[build:watch]
