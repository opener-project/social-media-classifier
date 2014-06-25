require File.expand_path('../lib/opener/social_media_classifier/version', __FILE__)

generated = Dir.glob('core/target/weka.jar')

Gem::Specification.new do |gem|
  gem.name          = 'opener-social-media-classifier'
  gem.version       = Opener::SocialMediaClassifier::VERSION
  gem.authors       = ['development@olery.com']
  gem.summary       = 'Opener Component for classifying Social Media.'
  gem.description   = gem.summary
  gem.homepage      = 'http://opener-project.github.com/'

  gem.license = 'Apache 2.0'

  gem.files = Dir.glob([
    'core/target/weka.jar',
    'lib/**/*',
    '*.gemspec',
    'README.md',
    'LICENSE.txt'
  ]).select { |file| File.file?(file) }

  gem.executables = Dir.glob('bin/*').map { |file| File.basename(file) }

  gem.add_dependency 'opener-build-tools'

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'cucumber'
  gem.add_development_dependency 'rake'
end
