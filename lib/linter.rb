require_relative 'colors'

class String 
  def lint_code
    puts "==>".green + "Fetch Helper tool"
    puts "To continue with linting, you need to agree that we'll install our helper tool"
    puts "y/n".bold

    user_input = gets.chomp.downcase

    if user_input == 'y'
      puts "==>".blue + "Download swiftlint"
      system("zsh -c 'brew install swiftlint'")
      puts "==>".green + "Linting Swift files in current working directory"
      system("zsh -c 'swiftlint'")
    elsif user_input == 'n'
      puts "Installation & Lint process killed".bold.red
      abort
    else
      puts "Unknown option: #{user_input}".red.bold
    end
  end
end
