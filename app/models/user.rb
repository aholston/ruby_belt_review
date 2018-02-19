class User < ActiveRecord::Base
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :first_name, :last_name, :city, presence: true, length: { minimum: 3}
  validates :state, presence: true, length: { is: 2 }
  has_secure_password

  has_many :events, dependent: :destroy
  has_many :attendees
  has_many :events_attending, through: :attendees, source: :event

  has_many :comments
  has_many :event_comments, through: :comments, source: :event

  before_save :downcase_email

  private
    def downcase_email
      self.email.downcase!
    end
end
