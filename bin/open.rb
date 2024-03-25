require_relative 'colors'

class String
  def openProject
    puts "==>".magenta + " Opening Project with ScribbleEditor"
    system("zsh -c 'echo Hi'")
  end
end
