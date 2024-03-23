#!/usr/bin/env ruby

require_relative 'colors'

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
  puts "  --list          List ScribbleLabApp Programm versions"
  puts "  --copyright     Shows copyright notice"
  puts "  --install       Install ScribbleLab"
  puts "\n"
  puts "See 'scribble help [option]' for detailed help."
end

def version
  puts "Scribble lldb cli v0.0.1-dev".bold
end

def copyright
  puts "ScribbleLab CLI - Copyright (C) 2024 ScribbleLabApp".bold
end

def install
  puts "DEBUG: Install ScribbleLab"
end

def list
    puts "DEBUG: SHOW JSON"
end

# Parse command line arguments
if ARGV.empty?
  usage
else
  case ARGV[0]
  when "-h", "--help"
    usage
  when "-V", "--version"
    version
  when "-c", "--copyright"
    copyright
  when "--install"
    install
  when "--list"
    list
  else
    puts "Unknown option: #{ARGV[0]}".red.bold
    puts "\n"
    usage
  end
end
