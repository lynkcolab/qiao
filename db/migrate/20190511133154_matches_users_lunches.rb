class MatchesUsersLunches < ActiveRecord::Migration[5.2]
  def change
    create_join_table :matches, :lunches
    create_join_table :matches, :users
  end
end
