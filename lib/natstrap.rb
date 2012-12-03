require "natstrap/version"

module Natstrap
  def padrino_init prj_name
    cmd = "padrino g project #{prj_name} -i -e erb -d activerecord -s jquery -c less"
    Kernel.system cmd
  end

  def install_templates prj_name

  end
end
