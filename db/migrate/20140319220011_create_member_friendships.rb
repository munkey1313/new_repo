class CreateMemberFriendships < ActiveRecord::Migration
  def change
    create_table :member_friendships do |t|
    	t.integer :member_id 
    	t.integer :friend_id
      	t.timestamps
    end

    add_index :member_friendships, [:member_id, :friend_id]
  end
end
