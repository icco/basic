module Natstrap

  # http://whatisthor.com/
  class CLI < Thor
    desc "new name", "Create a project named NAME."
    def new prj_name
      # Init padrino
      Natstrap::Utils.create_padrino prj_name

      # enter into the dir
      FileUtils.cd prj_name, :verbose => Natstrap::DEV

      # Track all of our changes with git
      Natstrap::Utils.git_init
      Natstrap::Utils.git_commit "padrino init."

      # Install templates, update gems
      Natstrap::Utils.extend_padrino prj_name
      Natstrap::Utils.git_commit "padrino configured."

      # Move folders around the way I like them
      Natstrap::Utils.reorganize_public
      Natstrap::Utils.git_commit "public folder reorganized"

      # Download and extract bootstrap framework.
      Natstrap::Utils.add_bootstrap 'public'
      Natstrap::Utils.git_commit "bootstrapped"
    end

    desc "launch", "Launch a new server."
    def launch
      puts "Launching!"
    end
  end
end
