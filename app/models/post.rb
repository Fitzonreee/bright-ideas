class Post < ActiveRecord::Base
  belongs_to :user
  has_many :likes

  has_many :users_liked, through: :likes, source: :user

  # God, I hope this works
  def self.top
    order('likes_count DESC')
  end

end
