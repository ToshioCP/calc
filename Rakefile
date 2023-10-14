# This "Rakefile" does three things:
# - Just type 'rake' to compile 'racc/calc.y' into 'lib/calc/calc.rb'.
# - Type 'rake rdoc' to create HTML documents.
# - Type 'rake test' for the test.

require "rdoc/task"
require "rake/testtask"

task default: "lib/calc/calc.rb"

file "lib/calc/calc.rb" => "racc/calc.y" do
  sh "racc -o lib/calc/calc.rb racc/calc.y"
end

# RDoc::Task creates the following tasks.
# [rdoc] Generate RDoc files
# [clobber_rdoc] Delete all the rdoc files.
# [rerdoc] Rebuild the rdoc files from scratch, even if they are not out of date.
#
# See {Rdoc document}[https://ruby.github.io/rdoc/RDoc/Task.html] for further information.
RDoc::Task.new do |rdoc|
  rdoc.main = "README.md"
  rdoc.title = "Calc"
  rdoc.rdoc_dir = "docs"
  rdoc.rdoc_files.include("README.md", "License.md", "lib/calc/*.rb")
end
task :rdoc do
  touch "docs/.nojekyll"
end

Rake::TestTask.new do |t|
  t.test_files = Dir.glob("test/test_*")
  t.verbose = true
end
