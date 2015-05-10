namespace :jekyll do
  task :build do
    puts '-> Building Jekyll site...'
    report_time do
      Kernel.system('bin/jekyll', 'build', '-q')
    end
    puts '-> Jekyll site built.'
  end

  task :clean do
    echo '-> Cleaning Jekyll site...'
    report_time do
      FileUtils.rm_rf '_site'
    end
    echo '-> Jekyll site cleaned.'
  end
end
