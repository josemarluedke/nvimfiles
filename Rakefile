require_relative "colorize"

MARGIN = " " * 5
COLS = `tput cols`.to_i
LINE = ("_" * COLS).colorize(:black)

def execute cmd, message, error

  margin = COLS - message.size - MARGIN.size * 2
  puts
  print MARGIN + message.colorize(:white)
  unless system "#{cmd} > /dev/null 2>&1"
    print "#{" " * (margin - 8)}[#{"FAILED".colorize(:red)}]\r\n"
    puts LINE
    puts
    puts MARGIN + "Ooooops".colorize(:red)
    puts MARGIN + error % cmd.colorize(:white)
    puts
    puts LINE
    puts
    abort
  end
  print "#{" " * (margin - 4)}[#{"OK".colorize(:green)}]\r\n"
  puts LINE

end

desc "Install the whole thing and dependencies"
task :install do
  root = File.expand_path(File.dirname(__FILE__))
  puts ("_" * COLS).colorize(:black)

  execute "vim --version | grep '+ruby'",
          "Checking ruby support on vim...",
          "Your Vim doesn't have Ruby support.\r\n#{MARGIN}You must reinstall it and run this command again."

  execute "brew install ack",
          "Installing ack...",
          "Could not install ack. Please install it manually and try again."

  execute "brew install ctags",
          "Installing ctags...",
          "Could not install ctags. Please install it manually and try again."

  execute "vim -c BundleInstall! -c q -c q -u ~/.vim/bundles.vim",
          "Installing Bundles...",
          "Could not install Vim plugins.\r\n#{MARGIN}Try %s yourself."

  puts
  puts MARGIN + "All done!".colorize(:green)
  puts MARGIN + "Be sure to checkout the helpful links in the README"
  puts MARGIN + "Issues/Wiki: #{"https://github.com/joaomilho/vimfiles_ruby_dragon".colorize(:blue)}"
  puts
  puts LINE
  puts
end

desc "Update to latest and greatest"
task :update do
  system("git pull origin master")
  puts "Updating Bundles"
  system "vim -c BundleInstall! -c BundleClean! -c q -c q"

  puts "*" * 79
  puts
  puts "Finished"
  puts
  puts "*" * 79
end
