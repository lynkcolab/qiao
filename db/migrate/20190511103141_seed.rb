class Seed < ActiveRecord::Migration[5.2]
  def up
    ["Marketing", "Finance", "Business & Technology", "Uptime", "HR", "Customer experience"].each do |dep|
      Department.create(name: dep)
    end
  end
 
  def down
    Department.delete_all
  end
end
