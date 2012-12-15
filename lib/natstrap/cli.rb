require 'thor'

module Natstrap
  class CLI < Thor
    desc "new name", "Create a project named NAME."
    def new prj_name
      cmd = "padrino g project #{prj_name} -i -e erb -d activerecord -s jquery -c less"
      Kernel.system cmd
    end

    desc "launch", "Launch a new server."
    def launch
      puts "Launching!"
    end
  end
end
