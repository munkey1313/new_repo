class MemberFriendship < ActiveRecord::Base
	belongs_to :member 
	belongs_to :friend, class_name: 'Member', foreign_key: 'friend_id'

	attr_accessible :member, :friend, :member_id, :friend_id
end
