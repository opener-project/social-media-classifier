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
    # input filename of the set that we want to be classified.
    # output filename. 
    # Full path or relative path (current directory.)
    #
    def initialize(input, output)
      @input  = input
      @output = output
    end
    
    def classify
      command1 = "sed -i '18s/.*/@attribute category? {0,1,2,3}/' #{input}"
      command2 = "java -classpath #{CORE_DIRECTORY}/target/weka.jar weka.filters.supervised.attribute.AddClassification -serialized #{TMP_DIRECTORY}/rf_liking.model -classification  -remove-old-class -i #{input} -o #{output}.liking -c last"
      command3 = "sed -i '18s/.*/@attribute category? {0,1}/' #{input}"
      command4 = "java -classpath #{CORE_DIRECTORY}/target/weka.jar weka.filters.supervised.attribute.AddClassification -serialized #{TMP_DIRECTORY}/rf_recommendation.model -classification  -remove-old-class -i #{input} -o #{output}.recommendation -c last"
      `#{command1}`
      `#{command2}`
      `#{command3}`
      `#{command4}`
    end
  end
end
