class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|

      t.timestamps
    end
  end
end
