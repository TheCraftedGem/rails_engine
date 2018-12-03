# Rails Engine

Welcome to Rails Engine, Rails Engine is a Ruby On Rails api application that exposes data for a number of resources, and displays business intelligence for a number of complex activerecord queries. It's built on Rails 5.1.6 and Postgresql 10.5 for a database, and returns fast_JSONApi data at each endpoint because it's using Netflix's new fast_jsonapi as a serializer.  

# Setup 
First, clone these repositories:

git clone git@github.com:TheCraftedGem/rails_engine.git <-- This is the Actual Project
git@github.com:turingschool/rales_engine_spec_harness.git <-- This is the Spec Harness For your Test Suite
https://github.com/turingschool/rales_engine_spec_harness <-- Here's a link to instructions on using the spec harness. 

Then run bundle install/update after navigating to the project directory. If that works, run the following command to create the database: 

rake db:{drop,create,migrate}

Next to import all the CSV data into your database run the following command otherwise your tables will be empty:

rake import:all

Then run: 

rake db:{seed}

You should be able to run rspec from the command line to run our local test suite.

Also I would recommend a good understanding of factory bot and shoulda matchers, otherwise the tests won't make too much sense. 

# Gems To Install
Here are all the Gems used in this repo:
 gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
 gem 'rspec-rails' 
 gem 'pry'
 gem 'awesome_print'
 gem 'factory_bot_rails'
 gem 'simplecov'
 gem 'database_cleaner'
 gem 'shoulda-matchers', '~> 3.1'
 gem 'listen', '>= 3.0.5', '< 3.2'
 gem 'spring'
 gem 'spring-watcher-listen', '~> 2.0.0'




