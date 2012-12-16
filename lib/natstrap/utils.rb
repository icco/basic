module Natstrap
  class Utils
    def self.create_padrino project_name
      cmd = "padrino g project #{project_name} -i -e erb -d activerecord -s jquery -c less"
      Kernel.system cmd
    end

    def self.add_bootstrap
      ""
    end
  end
end
