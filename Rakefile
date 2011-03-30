configuration = ENV['CONFIGURATION'] || 'Debug'

task :default => :build

desc "Use rebar to build the application"
task :build do
  sh "rebar compile"
end

desc "Clean the build"
task :clean do
  binDirs = Rake::FileList.new('**/*.beam')
  FileUtils.rm_rf(binDirs);
  FileUtils.rm_rf(".eunit");
end

desc "Run the unit tests with NUnit"
task :test do
  sh "rebar eunit"
end

