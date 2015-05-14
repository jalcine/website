namespace :rsync do
  task :copy do
    src_dir = settings[:rsync_source]
    dest_dir = "#{settings[:user]}@#{settings[:domain]}:#{deploy_to}/tmp/rsync"

    if !Dir.glob(src_dir).empty?
      rsync_command = ['rsync']
      rsync_command += settings[:rsync_options]
      rsync_command += [src_dir]
      rsync_command += [dest_dir]
      rsync_command = rsync_command.join(' ')
      puts "-> Invoking '#{rsync_command}'.."
      Kernel.system rsync_command

      print_msg "Moving from #{deploy_to} to build directory..."
      queue %(
        mv #{deploy_to}/tmp/rsync/* .
        rm #{deploy_to}/tmp/rsync/* -r
      )
    else
      print_msg '-> Cannot copy, src_dir is empty.'
    end
  end
  task :setup do
    puts '-> Setting up rsync temporary directory...'
    queue %(
      mkdir -p #{deploy_to}/tmp/rsync
      chown -R #{web_user}:www-data #{deploy_to}/tmp/rsync
    )
    puts '-> Set up rsync temporary directory.'
  end
end
