require 'fileutils'
class NewSinatra::FileGenerator

    def self.generate_files
      app_name = NewSinatra::Main.app_name
      is_skip_database_true = NewSinatra::Main.skip_database?
      puts "      create"
      FileUtils.mkdir(app_name)

        # app
      puts "      create  app"
      FileUtils.mkdir("#{app_name}/app")
        # app/controllers
      puts "      create  app/controllers"
      FileUtils.mkdir("#{app_name}/app/controllers")
      puts "      create  app/controllers/application_controller.rb"
      FileUtils.touch("#{app_name}/app/controllers/application_controller.rb")

        # app/models
      puts "      create  app/models"
      FileUtils.mkdir("#{app_name}/app/models")

        # app/views
      puts "      create  app/views"
      FileUtils.mkdir("#{app_name}/app/views")
      puts "      create  app/views/layout.erb"
      FileUtils.touch("#{app_name}/app/views/layout.erb")
      puts "      create  app/views/index.erb"
      FileUtils.touch("#{app_name}/app/views/index.erb")

        # config
      puts "      create  config"
      FileUtils.mkdir("#{app_name}/config")
      puts "      create  config/environment.rb"
      FileUtils.touch("#{app_name}/config/environment.rb")

      if !is_skip_database_true
          # db
        puts "      create  db"
        FileUtils.mkdir("#{app_name}/db")
        puts "      create  db/migrate"
        FileUtils.mkdir("#{app_name}/db/migrate")
      end

        # config.ru
      puts "      create  config.ru"
      FileUtils.touch("#{app_name}/config.ru")
        # CONTRIBUTING.md
      puts "      create  CONTRIBUTING.md"
      FileUtils.touch("#{app_name}/CONTRIBUTING.md")
        # Gemfile
      puts "      create  Gemfile"
      FileUtils.touch("#{app_name}/Gemfile")
        # Rakefile
      puts "      create  Rakefile"
      FileUtils.touch("#{app_name}/Rakefile")
        # README.md
      puts "      create  README.md"
      FileUtils.touch("#{app_name}/README.md")
    end

end