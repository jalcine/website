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
        sudo -u #{www_user} mv -v #{deploy_to}/tmp/rsync/* .
      )
    else
      print_msg '-> Cannot copy, src_dir is empty.'
    end
  end

  task :setup do
    queue %(
      sudo -u #{www_user} mkdir -p #{deploy_to}/tmp/rsync
    )
  end
end
