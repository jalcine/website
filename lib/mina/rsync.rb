namespace :rsync do
  task :copy do
    src_dir = settings[:rsync_source]
    dest_dir = "#{settings[:user]}@#{settings[:domain]}:#{deploy_to}/tmp/rsync"

    rsync_command = ['rsync']
    rsync_command += settings[:rsync_options]
    rsync_command += [ src_dir ]
    rsync_command += [ dest_dir ]
    rsync_command = rsync_command.join(' ')
    puts "-> Invoking #{rsync_command}.."
    Kernel.system rsync_command

    print_msg "Moving from #{deploy_to} to build directory..."
    queue %{
      mv -v #{deploy_to}/tmp/rsync/* .
    }
  end

  task :setup do
    queue %{
      mkdir -p #{deploy_to}/tmp/rsync
    }
  end
end
