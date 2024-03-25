require_relative 'colors'

class String
  attr_accessor :answer

  def update_scribble
    puts "RUNNING SCRIBBLE AUTO UPDATE"
    puts "==>".blue.bold + " Check upstream repository...".bold

    # Define your GitHub repository and the local version file
    repo = "ScribbleLabApp/ScribbleDeveloper-CLI"
    local_version_file = File.expand_path('../data/version.txt', __dir__)

    # Get the latest release version from GitHub
    latest_release = %x{
      curl -s "https://api.github.com/repos/#{repo}/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/'
    }.strip

    if latest_release.empty?
      puts "==>".red.bold + " Failed to retrieve latest release version from GitHub."
      puts "\n"
      puts "Please inform our development team and try again later."
      exit 1
    end

    # Get the local version
    local_version = File.read(local_version_file).strip

    # Compare versions
    if latest_release == local_version
      puts "==>".green.bold + " ScribbleLab is already up to date 🎊".bold
      puts "\n"
      puts "To check ScribbleLab's version number, run:"
      puts "  scribble --version"
    else
      puts "==>".yellow.bold + " A new version (#{latest_release}) is available."
      puts "Do you want to update to #{latest_release}? (y/n): "
      self.answer = $stdin.gets.chomp.downcase

      if answer == 'y'
        # TODO: Fetch latest release with progress bar
        puts "==>".green.bold + "Fetch #{latest_release} from GitHub..."
        %x{curl -sL "https://github.com/#{repo}/archive/#{latest_release}.tar.gz" -o scribble-latest.tar.gz}

        # TODO: extract lastest release
        puts "==>".blue.bold + " Download and extract #{latest_release}..."
        %x{tar -xzf scribble-latest.tar.gz}

        # TODO: Remove old cli, move scribble-latest.tar.gz to usr/local/bin and delete the other copy
        puts "==>".magenta.bold + " Cleaning up installation files..."
        %x{
          # Remove old cli version
          old_cli_path="/usr/local/bin/scribble"
          if [ -d "$old_cli_path" ]; then
            echo "Removing old version..."
            rm -rf "$old_cli_path"
          fi

          # Move the downloaded version to usr/local/bin and rename it to scribble
          mv "#{latest_release}" /usr/local/bin/scribble
        }

        puts "==>".magenta.bold + " Finishing up installation..."
        %x{
          echo "Check path of scribble:"
          which scribble
          scribble --version
          echo "NOTICE: When you didn't recieve any output scribble-cli was either removed from it's path or is not accessible."
        }

        puts "==>".green.bold + " ScribbleLab updated successfully to #{latest_release}🎊"
        puts "\n\n"
        puts "The #{latest_release} changelog can be found at:"
        puts "    https://github.com/#{repo}/releases/tag/#{latest_release}".blue
        exit 0
      else
        puts "Update cancelled.".bold.red
        exit 1
      end
    end
  end
end

