class User < ApplicationRecord
  before_save { email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }

  #REGEX = regular expression
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, 
            length: { maximum: 255 },
            format:{ with: EMAIL_REGEX},
            uniqueness: { case_sensitive: false}
  
  has_secure_password
  validates :password, length: { minimum: 6 }, allow_nil: true

  mount_uploader :avatar, AvatarUploader
  has_many :lessons, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :replies
  def follow(other_user)
    Relationship.create(
      follower_id: id,            #current_user.id
      followed_id: other_user.id  #@user.id
    )
  end

  def active_relationships
    Relationship.where(follower_id: id)
  end


  def relationship(other_user)
    active_relationships.find_by(followed_id: other_user.id)
  end

  def passive_relationships
    Relationship.where(followed_id: id)
  end

  def followers
    ids = passive_relationships.pluck(:follower_id)
    User.where(id: ids)
  end

  def following
    ids = active_relationships.pluck(:followed_id)
    User.where(id: ids)
  end
  
  def feed
    ids = following.pluck(:id)
    ids << id      #append | add the user_id to the array
    Activity.where(user_id: ids)
  end
end
