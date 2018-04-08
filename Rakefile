# frozen_string_literal: true

require 'rake'
require 'fileutils'
require 'dotenv'

task default: %w[clean build:dev]

task :clean do
  FileUtils.rmdir('_deploy', verbose: true)
  FileUtils.rmdir('_site', verbose: true)
end

def run_jekyll(args = [])
  command = 'bin/jekyll' + ' ' + args.join(' ')
  puts system(command)
end

def run_jekyll_in_dev(args = [])
  run_jekyll(args + ['--config', '_config.yml,_config.dev.yml'])
end

def run_jekyll_in_prod(args = [])
  run_jekyll(args + ['--destination', './_deploy'])
end

task :serve do
  system 'bin/jekyll serve'
end

namespace :build do
  task :watch do
    run_jekyll_in_dev(['build', '--incremental', '--watch'])
  end

  task :prod do
    run_jekyll_in_prod(['build'])
  end

  task :dev do
    run_jekyll_in_dev(['build', '--verbose', '--trace'])
  end
end

task :dev do
  Dotenv.overload('.envrc.local')
end

task :prod do
  Dotenv.overload('.envrc')
end

task :notify do
  if ENV['JEKYLL_ENV'] == 'production'
    ['notify:pingomatic', 'notify:google', 'notify:bing', 'notify:webmention'].each do |task|
      Rake::Task[task].invoke
    end
  end
end

desc 'Notify various services that the site has been updated'
namespace :notify do
  desc 'Notify Ping-O-Matic'
  task :pingomatic do
    begin
      require 'xmlrpc/client'
      puts '* Notifying Ping-O-Matic that the site has updated'
      XMLRPC::Client.new('rpc.pingomatic.com', '/').call('weblogUpdates.extendedPing', 'jacky.wtf' , '//jacky.wtf', '//jacky.wtf/atom.xml')
    rescue LoadError
      puts '! Could not ping ping-o-matic, because XMLRPC::Client could not be found.'
    end
  end

  desc 'Notify Google of updated sitemap'
  task :google do
    begin
      require 'net/http'
      require 'uri'
      puts '* Notifying Google that the site has updated'
      Net::HTTP.get('www.google.com', '/webmasters/tools/ping?sitemap=' + URI.escape('//jacky.wtf/sitemap.xml'))
    rescue LoadError
      puts '! Could not ping Google about our sitemap, because Net::HTTP or URI could not be found.'
    end
  end

  desc 'Notify Bing of updated sitemap'
  task :bing do
    begin
      require 'net/http'
      require 'cgi'
      puts '* Notifying Bing that the site has updated'
      Net::HTTP.get('www.bing.com', '/webmaster/ping.aspx?siteMap=' + CGI.escape('//jacky.wtf/sitemap.xml'))
    rescue LoadError
      puts '! Could not ping Bing about our sitemap, because Net::HTTP or URI could not be found.'
    end
  end

  desc 'Notify the IndieWeb'
  task :webmention do
    puts '* Notifying webmention.io'
    puts `bin/jekyll webmention`
  end
end

task deploy: %i[clean prod build:deploy upload:setup upload:deploy notify]
task 'deploy:dev': %i[clean dev build:deploy upload:setup upload:deploy]
