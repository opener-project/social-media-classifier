# Social Media Classifier

This repository contains the source code used for classifying Social Media.
This version classifies Facebook pages for hotels, both for liking and for recommendation
(see documentation)

## Requirements

* Java 1.7 or newer
* Ruby 1.9.2 or newer

Development requirements:

* Bundler

## Installation

Installing as a regular Gem:

    gem install opener-social-media-classifier

Using Bundler:

    gem 'opener-social-media-classifier',
      :git    => 'git@github.com:opener-project/social-media-classifier.git',
      :branch => 'master'

Using specific install:

    gem install specific_install
    gem specific_install opener-social-media-classifier \
       -l https://github.com/opener-project/social-media-classifier.git

## Generate the model (required)

First make sure all the required dependencies are installed:

    bundle install

Then generate the required Weka model:

    bundle exec rake generate

For this you'll need to have Java 1.7. and maven.

To install them (on linux):

    sudo apt-get purge openjdk*

    sudo add-apt-repository ppa:webupd8team/java

    sudo apt-get update
 
    sudo apt-get install oracle-java7-installer

    sudo apt-get install maven

These requirements
are verified for you before the Rake.


## Usage

    social-media-classifier input output
    (produces two files <output.liking> <output.recommendation> )


## Testing

To run the tests (which are powered by Cucumber), simply run the following:

    bundle exec rake

This will take care of verifying the requirements, installing the required Java
packages and running the tests.

For more information on the available Rake tasks run the following:

    bundle exec rake -T

## Structure

This repository comes in two parts: a collection of Java source files, Weka sets and Ruby
source files. The Java code and Weka requirements can be found in the `core/` directory, everything
else will be Ruby source code.
