task :install do
  root = File.expand_path(File.dirname(__FILE__))

  puts 'Installing Bundles'
  system "vim -c PlugInstall -c q -c q -u bundles.vim"

  puts '*' * 79
  puts
  puts 'All done!'
  puts 'Be sure to checkout the helpful links in the README'
  puts 'Issues/Wiki: https://github.com/josemarluedke/vimfiles'
  puts
  puts '*' * 79
end

desc 'Update to latest and greatest'
task :update do
  system('(which git-up > /dev/null && git-up) || git pull origin master')
  puts 'Updating Bundles'
  system "vim  -c PlugClean! -c PlugUpgrade -c PlugUpdate -c q -c q"

  puts '*' * 79
  puts
  puts 'Finished'
  puts
  puts '*' * 79
end
