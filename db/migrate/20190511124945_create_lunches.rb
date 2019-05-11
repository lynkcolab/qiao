class CreateLunches < ActiveRecord::Migration[5.2]
  def change
    create_table :lunches do |t|
      t.datetime :start

      t.timestamps
    end
  end
end
