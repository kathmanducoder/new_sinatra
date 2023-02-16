class NewSinatra::Main

    @@app_name = ""
    @@options = {:skip_database => false}
  
    def self.main(args)
      if !cmd_arg_is_valid?(args)
        exit(false)
      end
      @@app_name = args[0]
      NewSinatra::FileGenerator.generate_files
      NewSinatra::ContentBuilder.build_content
  
      puts "         run  git init inside #{@@app_name}"
      git_command = "git init #{@@app_name}"
      if !system(git_command)
        puts "'git init' failed."
      end
    end
  
    def self.app_name
      @@app_name
    end
  
    def self.skip_database?
      @@options[:skip_database]
    end
  
    private
  
    def self.cmd_arg_is_valid?(args)
      if args.length == 0
        usage("Missing app name")
        return false
      end
  
      if args.length == 2
        if args[1] == "--skip-database"
          @@options[:skip_database] = true
        else
          usage("Invalid command")
          return false
        end
      end
  
      if File.exists?(args[0])
        puts "Please choose a different app name. A file(or directory) already exists with that name in this folder."
        return false
      end
  
      true
    end
  
    def self.usage(error_msg)
      puts "Error: #{error_msg}."
      puts "Usage: new_sinatra <sinatra_app_name> {--skip-database}"
    end
  
  end