#!/usr/bin/env ruby

require 'optparse'
require_relative 'colors'
require_relative 'installer'
require_relative 'linter'

$cli_version = "0.0.1-dev"
$scribblelab_version = "n/a"

def usage
  puts "OVERVIEW: A set of command line tools that ship with ScribbleLab"
  puts "which allow users to create and debug custom Plug-In's and extensions."
  puts "\n"
  puts "Version: 0.0.1-dev".bold
  puts "\n"
  puts "Usage: scribble [option] [flag]"
  puts "\n"
  puts "Options:".bold.underline
  puts "  -h, --help      Show this message"
  puts "  -V, --version   Show version information"
  puts "  -v, --verbose   Make some output more verbose."
  puts "  -l, --lint      Lint project code"
  puts "  -a, --audit     Audit plug-in code with ScribbleAudit Service"
  puts "  --list          List ScribbleLabApp Programm versions"
  puts "  --copyright     Shows copyright notice"
  puts "  --install       Install ScribbleLab"
  puts "  --update        Update ScribbleLab"
  puts "\n"
  puts "See 'scribble help [option]' for detailed help."
end

def version
    puts "==>".blue + " Check version information for ScribbleLab..."
    puts "\n"
    puts "ScribbleLab CLI #{$cli_version} ✨".bold
    puts "ScribbleLab #{$scribblelab_version} ✨".bold
end

def copyright
  puts "ScribbleLab CLI - Copyright (C) 2024 ScribbleLabApp".bold
end

def list
  puts "DEBUG: SHOW JSON"
end

def install
  "".install_scribblelab
end

def update
  puts "==>".green + " ScribbleLab is already up to date 🎊".bold
  puts "\n"
  puts "To check ScribbleLab's version number, run:"
  puts "  scribble --version"
end

def lint
  "".lint_code
end

# Parse command line arguments
# if ARGV.empty?
  usage
# else
#   case ARGV[0]
#   when "-h", "--help"
#     usage
#   when "-V", "--version"
#     version
#   when "-c", "--copyright"
#     copyright
#   when "--install"
#     install
#   when "--list"
#     list
#   when "--update"
#     update
#   when "-l", "--lint"
#     lint
#   else
#     puts "Unknown option: #{ARGV[0]}".red.bold
#     puts "\n"
#     usage
#   end
# end

options = {}
OptionParser.new do |opts|
  opts.banner = "OVERVIEW: A set of command line tools that ship with ScribbleLab"
  opts.banner += "which allow users to create and debug custom Plug-In's and extensions."
  opts.banner += "\n\n"
  opts.banner += "Version: 0.0.1-dev".bold
  opts.banner += "\n\n"
  opts.banner += "Usage: scribble [option] [flag]"
  opts.banner += "\n\n"

  opts.on("-h", "--help", "Show this message") do
    usage
    exit
  end

  opts.on("-V", "--version", "Show version information") do
    version
    exit
  end

  opts.on("-c", "--copyright", "Show copyright notice") do
    copyright
    exit
  end

  opts.on("--list", "List ScribbleLabApp Programm versions") do
    list
    exit
  end

  opts.on("--install", "Install ScribbleLab") do
    install
    exit
  end

  opts.on("--update", "Update ScribbleLab") do
    update
    exit
  end

  opts.on("-l", "--lint", "Lint project code") do
    lint
    exit
  end
end.parse!
