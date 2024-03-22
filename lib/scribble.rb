#!/usr/bin/env ruby

def usage
    puts "Usage: ruby_cli_tool [option]"
    puts "Options:"
    puts "  -h, --help     Show help message"
    puts "  -g, --greet    Greet the user"
    puts "  -v, --version  Show version information"
  end
  
  # Define the greet function
  def greet
    print "Enter your name: "
    name = gets.chomp
    puts "Hello, #{name}! Welcome to the Ruby CLI tool."
  end

  def version
    print "Scribble lldb cli v0.0.1-dev"
  end
  
  # Parse command line arguments
  if ARGV.empty?
    usage
  else
    case ARGV[0]
    when "-h", "--help"
      usage
    when "-g", "--greet"
      greet
    when "-v", "--version"
      version
    else
      puts "Unknown option: #{ARGV[0]}"
      usage
    end
  end