module Natstrap
  class Utils
    def self.create_padrino project_name
      cmd = "padrino g project #{project_name} -i -e erb -d activerecord -s jquery -c less"
      Kernel.system cmd
    end

    def self.add_bootstrap dir
      bootstrap = "http://twitter.github.com/bootstrap/assets/bootstrap.zip"
      open bootstrap do |data|
        Zip::Archive.open_buffer(data.read) do |ar|
          ar.each do |zf|
            if zf.directory?
              dirname = zf.name.sub('bootstrap', dir)
              FileUtils.mkdir_p dirname, :verbose => Natstrap::DEV
            else
              filename = zf.name.sub('bootstrap', dir)
              dirname = File.dirname(filename)
              FileUtils.mkdir_p dirname, :verbose => Natstrap::DEV

              open(filename, 'wb') do |f|
                f << zf.read
              end
            end
          end
        end
      end
    end

    def self.reorganize_public
      [
        ['images', 'img'],
        ['javascripts', 'js'],
        ['stylesheets', 'css'],
      ].each do |from, to|
        FileUtils.mv "public/#{from}", "public/#{to}", :verbose => Natstrap::DEV
      end
    end
  end
end
