class AddMemberIdToLeagues < ActiveRecord::Migration
  def change
    add_column :leagues, :member_id, :integer
    add_index :leagues, :member_id
  end
end
