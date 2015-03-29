namespace :jekyll do
  # TODO: Add a timer here.
  # TODO: Add docs.
  task :build do
    puts '-> Building Jekyll site...'
    report_time do
      Kernel.system('bin/jekyll', 'build')
    end
    puts '-> Jekyll site built.'
  end

  # TODO: Add a timer here.
  # TODO: Add docs.
  task :clean do
    echo '-> Cleaning Jekyll site...'
    report_time do
      FileUtils.rm_rf '_site'
    end
    echo '-> Jekyll site cleaned.'
  end
end
