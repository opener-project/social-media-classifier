require_relative 'social_media_classifier/version'
require 'rake'

module Opener
  class SocialMediaClassifier
    attr_accessor :input, :output
    
    # Path to the directory containing all the Java source code.
    CORE_DIRECTORY = File.expand_path('../../../core', __FILE__)

    # Path to the local tmp/ directory.
    TMP_DIRECTORY = File.expand_path('../../../tmp', __FILE__)
    
    ##
    # Input filename (full path) of the set that we want to be classified.
    # Output filename (only name, stored in tmp directory.)
    def initialize(input, output)
      @input  = input
      @output = output
    end
    
    def classify
      command = "java -classpath #{CORE_DIRECTORY}/target/weka.jar weka.filters.supervised.attribute.AddClassification -serialized #{TMP_DIRECTORY}/rf.model -classification  -remove-old-class -i #{input} -o #{TMP_DIRECTORY}/#{output} -c last"
      `#{command}`
    end
  end
end