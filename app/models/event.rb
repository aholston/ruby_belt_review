class Event < ActiveRecord::Base
  validates :name, :city, presence: true, length: {minimum: 3}
  validates :state, presence: true, length: { is: 2 }
  validates :user_id, presence: true

  belongs_to :user
  has_many :attendees
  has_many :users_attending, through: :attendees, source: :user

  has_many :comments
  has_many :users_comments, through: :comments, source: :user

end
