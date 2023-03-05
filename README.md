# new_sinatra

## Description
Sinatra equivalent of 'rails new'. This Ruby utility gem will help you get started with a brand new Sinatra app by laying out its file and project structure.

This gem is available in rubygems. Check it out at:
https://rubygems.org/gems/new_sinatra

## Installation
Download the source code. An executable called 'new_sinatra' inside bin directory can be executed directly.

To build a gem, run the following command in the root directory of this application:

```console
gem build new_sinatra.gemspec
```

This will build a ruby gem for you, which you can install. To install this gem, execute:

```console
gem install new_sinatra-1.0.0.gem
```

This will install an executable called new_sinatra in your machine. You should be able to execute this executable from anywhere now.

## Usage
Once installed, you can use the program as follows:

```console
~> new_sinatra new_sinatra_app_name
      create
      create  app
      create  app/controllers
      create  app/controllers/application_controller.rb
      create  app/models
      create  app/views
      create  app/views/layout.erb
      create  app/views/index.erb
      create  config
      create  config/environment.rb
      create  db
      create  db/migrate
      create  config.ru
      create  CONTRIBUTING.md
      create  Gemfile
      create  Rakefile
      create  README.md
         run  git init inside new_sinatra_app_name
Initialized empty Git repository in /Users/anupkhadka/Code/new_sinatra_app_name/.git/

~/Code
~>
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).