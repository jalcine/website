require 'rake'
require 'fileutils'
require 'dotenv'

task default: %w[clean build:drafts serve]

task :clean do
  FileUtils.rmdir('deploy', verbose: true)
  FileUtils.rmdir('_site', verbose: true)
end

def run_jekyll(args=[])
  command = 'bin/jekyll ' + args.join(' ')
  system(command)
end

def run_jekyll_in_dev(args=[])
  run_jekyll(args + ['--trace', '--config', '_config.yml,_config.dev.yml'])
end

def run_jekyll_in_prod(args=[])
  run_jekyll(args + ['-d', '_deploy'])
end

namespace :build do
  task :watch do
    run_jekyll_in_dev(['build', '--incremental', '--watch'])
  end

  task :deploy do
    run_jekyll_in_prod(['build', '--verbose'])
  end

  task :dev do
    run_jekyll_in_dev(['build'])
  end
end


task :dev do
  Dotenv.load('.envrc.local')
end

task :prod do
  Dotenv.load('.envrc')
end

namespace :upload do
  task :setup do
    system 'bin/mina setup --verbose --trace'
  end

  task :deploy do
    system 'bin/mina deploy --verbose --trace'
  end
end

task notify: ["notify:pingomatic", "notify:google", "notify:bing"]

desc "Notify various services that the site has been updated"
namespace :notify do

  desc "Notify Ping-O-Matic"
  task :pingomatic do
    begin
      require 'xmlrpc/client'
      puts "* Notifying Ping-O-Matic that the site has updated"
      XMLRPC::Client.new('rpc.pingomatic.com', '/').call('weblogUpdates.extendedPing', 'jacky.wtf' , '//jacky.wtf', '//jacky.wtf/atom.xml')
    rescue LoadError
      puts "! Could not ping ping-o-matic, because XMLRPC::Client could not be found."
    end
  end

  desc "Notify Google of updated sitemap"
  task :google do
    begin
      require 'net/http'
      require 'uri'
      puts "* Notifying Google that the site has updated"
      Net::HTTP.get('www.google.com', '/webmasters/tools/ping?sitemap=' + URI.escape('//jacky.wtf/sitemap.xml'))
    rescue LoadError
      puts "! Could not ping Google about our sitemap, because Net::HTTP or URI could not be found."
    end
  end

  desc "Notify Bing of updated sitemap"
  task :bing do
    begin
      require 'net/http'
      require 'uri'
      puts '* Notifying Bing that the site has updated'
      Net::HTTP.get('www.bing.com', '/webmaster/ping.aspx?siteMap=' + URI.escape('//jacky.wtf/sitemap.xml'))
    rescue LoadError
      puts "! Could not ping Bing about our sitemap, because Net::HTTP or URI could not be found."
    end
  end
end

task deploy: %i[clean prod build:deploy upload:setup upload:deploy]
task 'deploy:dev': %i[clean dev build:deploy upload:setup upload:deploy]
