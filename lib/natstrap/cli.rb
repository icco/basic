require 'open-uri'
require 'thor'
require 'zipruby'

module Natstrap

  # http://whatisthor.com/
  class CLI < Thor
    desc "new name", "Create a project named NAME."
    def new prj_name
      cmd = "padrino g project #{prj_name} -i -e erb -d activerecord -s jquery -c less"
      Kernel.system cmd

      bootstrap = "http://twitter.github.com/bootstrap/assets/bootstrap.zip"
      open bootstrap do |data|
        Zip::Archive.open_buffer(data.read) do |ar|
          p ar
          ar.each do |zf|
            if zf.directory?
              FileUtils.mkdir_p(zf.name)
            else
              dirname = File.dirname(zf.name)
              FileUtils.mkdir_p(dirname) unless File.exist?(dirname)

              open(zf.name, 'wb') do |f|
                f << zf.read
              end
            end
          end
        end
      end
    end

    desc "launch", "Launch a new server."
    def launch
      puts "Launching!"
    end
  end
end
