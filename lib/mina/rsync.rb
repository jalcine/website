namespace :rsync do
  task :copy do
    src_dir = settings[:rsync_source]

    rsync_command = ['rsync']
    rsync_command += settings[:rsync_options]
    rsync_command += [ src_dir ]
    rsync_command += [ '$build_path']
    rsync_command = rsync_command.join(' ') 
    puts "-> Invoking #{rsync_command}.."

    Kernel.system rsync_command
  end
end
