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
    compile_ruby_file(file)
  end

  # Copy necessary files to the bin directory
  %w(colors linter open installer update_tools).each do |file|
    FileUtils.cp("lib/#{file}.rb", "bin/#{file}.rb")
  end
end

def compile_ruby_file(file)
  puts "Compiling #{file}"

  # Copy the compiled file to the bin directory
  output_file = file.gsub(/^lib\//, 'bin/').gsub(/\.rb$/, '')
  FileUtils.mkdir_p(File.dirname(output_file))
  FileUtils.cp(file, output_file)
end
