class League < ActiveRecord::Base
	#relationship for leagues belonging to members
	belongs_to :member
	# league name needs to be unique
	validates :name, uniqueness: true
	# A league has to have a name
    validates :name, presence: true
end
