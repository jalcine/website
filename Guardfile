guard :bundler do
  require 'guard/bundler'
  require 'guard/bundler/verify'
  helper = Guard::Bundler::Verify.new

  files = ['Gemfile']

  files.each { |file| watch(helper.real_path(file)) }
end

guard :rack do
  watch('Gemfile.lock')
  watch(%r{^(config|lib|app)/.*})
end
