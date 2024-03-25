#
#  Rakefile
#  ScribbleDeveloper CLI
#
#  Created by N3v1 on 25/03/24.
#  Copyright © 2024 ScribbleLabApp. All rights reserved.
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#

task :default => :compile

task :compile do
  Dir.glob('lib/**/*.rb').each do |file|
    # Compile each Ruby file in the lib folder
    compile_ruby_file(file)
  end
end

def compile_ruby_file(file)
  # You can perform any compilation steps here
  # For example, you might want to load the file and check for syntax errors
  # Or you might want to simply print a message indicating the file is being compiled
  puts "Compiling #{file}"

  # Example: Copy the compiled binary to the bin directory
  # Change this part according to your compilation process
  output_file = file.gsub(/^lib\//, 'bin/').gsub(/\.rb$/, '')
  FileUtils.mkdir_p(File.dirname(output_file))
  FileUtils.cp(file, output_file)
end

