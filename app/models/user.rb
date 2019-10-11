class User < ApplicationRecord
  has_many :children
  has_many :memories, dependent: :destroy
 
  has_many :children_with_memories, through: :memories, source: :child
  has_secure_password
  validates :password, presence: true, length: { minimum: 5 }, allow_nil: true
  validates :name, presence: true,  length:  { minimum: 2 }
  validates :email, presence: true, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }, length: { maximum: 40 }, uniqueness: {case_sensitive: false}

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
