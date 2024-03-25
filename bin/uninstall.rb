require_relative 'colors'

class String 
  def uninstall_scribble

    def underline_text(text)
      "\033[4m#{text}\033[24m"
    end

    puts "==>".bold.magenta + " UNINSTALL SCRIBBLE-CLI"
    puts "In order to uninstall scribble-cli visit our documentation and run this command:"

    code = <<~ZSH
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ScribbleLabApp/ScribbleDeveloper-CLI/main/scr/uninstall.sh)"
    ZSH

    puts underline_text(code)

    puts underline_text("https://github.com/ScribbleLabApp/ScribbleDeveloper-CLI")
  end
end
