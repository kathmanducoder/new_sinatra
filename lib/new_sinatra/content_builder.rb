class NewSinatra::ContentBuilder

    def self.build_content
      app_name = NewSinatra::Main.app_name
      is_skip_database_true = NewSinatra::Main.skip_database?
      build_app_controllers_files(app_name)
      build_app_views_layout_file(app_name)
      build_app_views_index_file(app_name)
      build_config_environment_file(app_name)
      build_configru_file(app_name)
      build_gemfile(app_name)
      build_rakefile(app_name)
      build_readme_file(app_name)
    end
  
    private
  
    def self.build_app_controllers_files(app_name)
      File.open("#{app_name}/app/controllers/application_controller.rb", 'w') do |file|
        file.write(
          <<~HEREDOC
          require './config/environment'
          class ApplicationController < Sinatra::Base
            configure do
              set :public_folder, 'public'
              set :views, 'app/views'
            end
            get '/' do
              erb :index
            end
          end
          HEREDOC
        )
      end
    end
  
    def self.build_app_views_layout_file(app_name)
      title = app_name.split(/[\/,\\]/).last.split(/[_,-]/).map {|word| word.capitalize}.join
      File.open("#{app_name}/app/views/layout.erb", 'w') do |file|
        file.write(
          <<~HEREDOC
          <!DOCTYPE HTML>
          <html>
            <head>
              <title>#{title}</title>
            </head>
            <body>
              <%= yield %>
            </body>
          </html>
          HEREDOC
        )
      end
    end
  
    def self.build_app_views_index_file(app_name)
      title = app_name.split(/[\/,\\]/).last.split(/[_,-]/).map {|word| word.capitalize}.join
      File.open("#{app_name}/app/views/index.erb", 'w') do |file|
        file.write(
          <<~HEREDOC
            <h1 style="text-align:center;font-family:Garamond;color:grey">#{title}</h1>
            <h2 style="text-align:center;font-family:Garamond;color:grey">You are in Sinatra</h2>
          HEREDOC
        )
      end
    end
  
    def self.build_config_environment_file(app_name)
      if !NewSinatra::Main.skip_database?
        database_content =
        <<~HEREDOC
        ActiveRecord::Base.establish_connection(
          :adapter => "sqlite3",
          :database => "db/development.sqlite"
        )
        HEREDOC
      else
        database_content = ""
      end
  
      content =
      <<~HEREDOC
        require 'bundler'
        require 'bundler/setup'
        Bundler.require(:default)
        #{database_content}
        require_all 'app'
      HEREDOC
  
      File.open("#{app_name}/config/environment.rb", 'w') do |file|
        file.write(content)
      end
    end
  
    def self.build_configru_file(app_name)
      if !NewSinatra::Main.skip_database?
        database_content =
        <<~HEREDOC
        if ActiveRecord::Base.connection.migration_context.needs_migration?
          raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
        end
        HEREDOC
      else
        database_content = ""
      end
  
      content =
      <<~HEREDOC
      require './config/environment'
      #{database_content}
      run ApplicationController
      HEREDOC
  
      File.open("#{app_name}/config.ru", 'w') do |file|
        file.write(content)
      end
    end
  
    def self.build_gemfile(app_name)
      if !NewSinatra::Main.skip_database?
        database_content =
        <<~HEREDOC
        gem "activerecord", :require => "active_record"
        gem "sinatra-activerecord", :require => "sinatra/activerecord"
        gem "sqlite3"
        HEREDOC
      else
        database_content = ""
      end
  
      content =
      <<~HEREDOC
      source 'http://rubygems.org'
      gem "require_all"
      gem "sinatra"
      #{database_content}
      gem "rake"
      gem "shotgun"
      gem "thin"
      HEREDOC
  
      File.open("#{app_name}/Gemfile", 'w') do |file|
        file.write(content)
      end
    end
  
    def self.build_rakefile(app_name)
      if !NewSinatra::Main.skip_database?
        database_content =
        <<~HEREDOC
        require 'sinatra/activerecord/rake'
        HEREDOC
      else
        database_content = ""
      end
  
      content =
      <<~HEREDOC
      require_relative './config/environment'
      #{database_content}
      HEREDOC
  
      File.open("#{app_name}/Rakefile", 'w') do |file|
        file.write(content)
      end
    end
  
    def self.build_readme_file(app_name)
      title = app_name.split(/[\/,\\]/).last.split(/[_,-]/).map {|word| word.capitalize}.join
      File.open("#{app_name}/README.md", 'w') do |file|
        file.write(
          <<~HEREDOC
          # #{title}
          HEREDOC
        )
      end
    end
  
  end