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

      FileUtils.cd(prj_name, :verbose => true)

      # Download and extract bootstrap framework.
      bootstrap = "http://twitter.github.com/bootstrap/assets/bootstrap.zip"
      open bootstrap do |data|
        Zip::Archive.open_buffer(data.read) do |ar|
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

      # rename bootstrap to public
      FileUtils.rm_rf 'public', :verbose => true
      FileUtils.mv 'bootstrap', 'public', :verbose => true
    end

    desc "launch", "Launch a new server."
    def launch
      puts "Launching!"
    end
  end
end
