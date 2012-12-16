module Natstrap

  # http://whatisthor.com/
  class CLI < Thor
    desc "new name", "Create a project named NAME."
    def new prj_name

      Natstrap::Utils.create_padrino prj_name

      FileUtils.cd prj_name, :verbose => Natstrap::DEV

      Natstrap::Utils.git_init


      Natstrap::Utils.extend_padrino

      # Move folders around the way I like them
      Natstrap::Utils.reorganize_public

      # Download and extract bootstrap framework.
      Natstrap::Utils.add_bootstrap 'public'
    end

    desc "launch", "Launch a new server."
    def launch
      puts "Launching!"
    end
  end
end
