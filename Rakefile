require_relative "colorize"

MARGIN = " " * 6
COLS = `tput cols`.to_i
LINE = ("/" * COLS).colorize(:black)

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
  puts
  puts LINE
end

desc "Install the whole thing and dependencies"
task :install do
  root = File.expand_path(File.dirname(__FILE__))
  puts LINE

  execute "vim --version | grep '+ruby'",
          "Checking Ruby support on Vim...",
          "Your Vim doesn't have Ruby support.\r\n#{MARGIN}You must reinstall it and run this command again."

  execute "vim --version | grep '+lua'",
          "Checking Lua support on Vim...",
          "Your Vim doesn't have Lua support.\r\n#{MARGIN}Look a the README for instructions."


  execute "brew install ack",
          "Installing ack...",
          "Could not install ack. Please install it manually and try again."

  execute "brew install ctags",
          "Installing ctags...",
          "Could not install ctags. Please install it manually and try again."

  execute "mkdir -p ~/.vim/bundle && if [ ! -d ~/.vim/bundle/vundle ]; then git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/vundle; fi",
          "Installing vundle...",
          "Could not install vundle."

  execute "if [ -f ~/.vimrc ]; then rm ~/.vimrc; fi; ln -s ~/.vim/vimrc ~/.vimrc",
          "Linking .vimrc...",
          "Could not link .vimrc"

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
