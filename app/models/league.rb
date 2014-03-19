class League < ActiveRecord::Base
	belongs_to :member
	validates :name, uniqueness: true
    validates :name, presence: true
end
