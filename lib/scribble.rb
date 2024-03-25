#!/usr/bin/env ruby

require 'optparse'
require_relative 'colors'
require_relative 'installer'
require_relative 'linter'
require_relative 'open'
require_relative 'update_tools'
require_relative 'uninstall'

$cli_version_file = File.expand_path('../data/version.txt', __dir__)
$cli_version = File.read($cli_version_file).strip
$cli_version = "Unknown" if $cli_version.empty? || !File.exist?($cli_version_file)

def usage
  puts "OVERVIEW: A set of command line tools that ship with ScribbleLab"
  puts "which allow users to create and debug custom Plug-In's and extensions."
  puts "\n"
  puts "Version:".bold.underline + " #{$cli_version}".bold
  puts "\n"
  puts "Usage:".bold.underline + " scribble [option] [flag]"
  puts "\n"
  puts "Options:".bold.underline
  puts "  create          Create a new plugin from template"
  puts "  open [name]     Open Plug-In's dir and launch ScribbleEditor"
  puts "  test            Run Unit Tests for your plugin"
  puts "  -h, --help      Show this message"
  puts "  -V, --version   Show version information"
  puts "  -v, --verbose   Make some output more verbose."
  puts "  -l, --lint      Lint project code"
  puts "  -a, --audit     Audit plug-in code with ScribbleAudit Service"
  puts "  --list          List ScribbleLabApp Programm versions"
  puts "  --copyright     Shows copyright notice"
  puts "  --install       Install ScribbleLab & ScribbleDeveloper"
  puts "  --update        Update scribble-cli"
  puts "  --uninstall     Uninstall scribble-cli"
  puts "\n"
  puts "See 'scribble help [option]' for detailed help."
  puts "\n"
end

def version
    puts "==>".blue + " Check version information for ScribbleLab..."
    puts "\n"
    puts "ScribbleLab CLI #{$cli_version} ✨".bold
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
  # puts "==>".green + " ScribbleLab is already up to date 🎊".bold
  # puts "\n"
  # puts "To check ScribbleLab's version number, run:"
  # puts "  scribble --version"
  "".update_scribble
end

def lint
  "".lint_code
end

def openPr
  "".openProject
end

def uninstall
  puts "DEBUG"
end

# ARGV Praser
options = {}
OptionParser.new do |opts|
  opts.banner = "OVERVIEW: A set of command line tools that ship with ScribbleLab"
  opts.banner += "which allow users to create and debug custom Plug-In's and extensions."
  opts.banner += "\n\n"
  opts.banner += "Version: DEBUG".bold
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

  opts.on("create", "Create a new plugin from template") do
    # Define what happens when "--create" option is specified
    # For example:
    # create_plugin
    exit
  end

  opts.on("open", "Open Plug-In's dir and launch ScribbleEditor") do |name|
    # Define what happens when "--open" option is specified
    # The argument 'name' will contain the value passed after "--open"
    # For example:
    # open_project(name)
    # cmd: open [name]
    open_project
    exit
  end

  opts.on("test", "Run Unit Tests for your plugin") do
    # Define what happens when "--test" option is specified
    # For example:
    # run_tests
    exit
  end

  opts.on("--uninstall", "Uninstall scribble-cli") do
    uninstall
    exit
  end
end.parse!

if ARGV.empty? || !["create", "open", "test"].include?(ARGV.first)
  puts "Error:".red.bold + " Unrecognized command '#{ARGV.first}'. Please provide a valid command."
  puts "Use 'scribble --help' for usage instructions."
  exit 1
end
