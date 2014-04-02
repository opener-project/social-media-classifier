require File.expand_path('../lib/opener/social_media_classifier/version', __FILE__)

generated = Dir.glob('core/target/weka.jar')

Gem::Specification.new do |gem|
  gem.name          = 'social-media-classifier'
  gem.version       = Opener::SocialMediaClassifier::VERSION
  gem.authors       = ['development@olery.com']
  gem.summary       = 'Opener Component for classifying Social Media.'
  gem.description   = gem.summary
  gem.homepage      = 'http://opener-project.github.com/'

  gem.files         = (`git ls-files`.split("\n") + generated).sort
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})

  gem.add_dependency 'opener-build-tools'

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'cucumber'
  gem.add_development_dependency 'pry'
  gem.add_dependency 'rake'
end
