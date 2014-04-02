require 'bundler/gem_tasks'
require 'opener/build-tools'
require 'opener/build-tools/tasks/java'
require 'opener/build-tools/tasks/clean'

include Opener::BuildTools::Requirements
include Opener::BuildTools::Java

# Path to the directory containing all the Java source code.
CORE_DIRECTORY = File.expand_path('../core', __FILE__)

# Path to the local tmp/ directory.
TMP_DIRECTORY = File.expand_path('../tmp', __FILE__)

desc 'Lists all the files of the Gem'
task :files do
  gemspec = Gem::Specification.load('social-media-classifier.gemspec')

  puts gemspec.files.sort
end

desc 'Verifies the requirements'
task :requirements do
  require_executable('java')
  require_version('java', java_version, '1.7')
  require_executable('mvn')
end

desc 'Generate model from training set'
task :generate => :requirements do
  command = "java -classpath #{CORE_DIRECTORY}/target/weka.jar weka.classifiers.meta.FilteredClassifier -t #{CORE_DIRECTORY}/target/training.arff  -d #{TMP_DIRECTORY}/rf.model -F 'weka.filters.MultiFilter -F weka.filters.unsupervised.attribute.StringToWordVector -F weka.filters.unsupervised.attribute.Standardize' -W  weka.classifiers.trees.RandomForest -- -I 100"
  sh command
end

desc 'Alias for java:compile'
task :compile => :generate do
  command = "java -classpath #{CORE_DIRECTORY}/target/weka.jar weka.filters.supervised.attribute.AddClassification -serialized #{TMP_DIRECTORY}/rf.model -classification  -remove-old-class -i #{CORE_DIRECTORY}/target/test1.arff -o #{TMP_DIRECTORY}/output.arff -c last"
  sh command
end

desc 'Runs the tests'
task :test => :compile do
  sh 'cucumber features'
end

desc 'Cleans the repository'
task :clean => ['java:clean:packages', 'clean:tmp']

task :build   => :compile
task :default => :test
