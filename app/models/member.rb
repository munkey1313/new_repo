class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  # This class adds functionality to the devise classes.
  # Specifically it adds the ability to follow users, unfollow users, and search users by email.

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessor :current_password
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_many :leagues
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_member, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  # Find out if you are following someone.
  def following?(other_member)
    relationships.find_by(followed_id: other_member.id)
  end

  # Follow users.
  def follow!(other_member)
    relationships.create!(followed_id: other_member.id)
  end

  # Unfollow users
  def unfollow!(other_member)
    relationships.find_by(followed_id: other_member.id).destroy
  end

  # Search Users
  def self.search(query)
    where("email like ?", "%#{query}%") 
  end

end
