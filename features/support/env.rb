require_relative '../../lib/opener/social_media_classifier'
require 'rspec/expectations'
require 'tempfile'

def kernel_root
  File.expand_path("../../../", __FILE__)
end

def kernel(input, output)
  return Opener::SocialMediaClassifier.new(input, output)
end