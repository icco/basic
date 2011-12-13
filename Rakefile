# Import in official clean and clobber tasks
require 'rake/clean'
CLEAN.include("data.db")

desc "Create local db."
task :db do
  require "sequel"

  db_url = ENV['DATABASE_URL'] || "sqlite://db/data.db"
  migrations_dir = "./db/migrations/"

  puts "Migrating from '#{migrations_dir}' into '#{db_url}'."

  ret = Kernel.system("sequel -m #{migrations_dir} #{db_url}");

  if ret
    puts "Database migrated."
  else
    puts "Database migration failed."
  end

  puts "Database built."
end
