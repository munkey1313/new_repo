class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_many :leagues
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_member, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  def following?(other_member)
    relationships.find_by(followed_id: other_member.id)
  end

  def follow!(other_member)
    relationships.create!(followed_id: other_member.id)
  end

  def unfollow!(other_member)
    relationships.find_by(followed_id: other_member.id).destroy
  end

  def self.search(query)
    where("email like ?", "%#{query}%") 
  end

  def update
    # For Rails 4
    account_update_params = devise_parameter_sanitizer.sanitize(:account_update)
    # For Rails 3
    # account_update_params = params[:user]

    # required for settings form to submit when password is left blank
    if account_update_params[:password].blank?
      account_update_params.delete("password")
      account_update_params.delete("password_confirmation")
    end

    @member = Member.find(current_user.id)
    if @member.update_attributes(account_update_params)
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @member, :bypass => true
      redirect_to after_update_path_for(@member)
    else
      render "edit"
    end
  end

end
