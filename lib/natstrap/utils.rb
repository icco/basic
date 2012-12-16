module Natstrap
  class Utils

    # Based off of https://github.com/wycats/thor/blob/master/lib/thor/actions/file_manipulation.rb#L103
    def self.write_template template, opts = {}
      template_dir = File.join(File.dirname(__FILE__), "templates")

      source = File.join(template_dir, "#{template}.tt")

      namespace = OpenStruct.new(opts)
      context = namespace.instance_eval { binding }

      content = ERB.new(::File.binread(source), nil, '-', '@output_buffer').result(context)
      open(template, 'wb') do |f|
        f << content
      end
    end

    def self.create_padrino project_name
      cmd = "padrino g project #{project_name} -i -e erb -d activerecord -s jquery -c less"
      Kernel.system cmd
    end

    def self.extend_padrino project_name
      Natstrap::Utils.write_template "Gemfile"

      Kernel.system "bundle update"

      Natstrap::Utils.write_template "config/database.rb", :name => project_name

      [
        "padrino g model Entry text:text"
      ].each {|cmd| Kernel.system cmd }

      Natstrap::Utils.write_template "Rakefile"
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

    def self.git_init
      g = Git.init
      Natstrap::Utils.write_template "README.md"
      g.add('README.md')
      g.commit('init.')
    end

    def self.git_commit msg
      g = Git.open(FileUtils.pwd, :log => Logger.new(STDOUT))
      g.add('.')
      g.commit_all(msg)
    end
  end
end
