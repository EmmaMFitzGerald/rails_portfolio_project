class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :children
  has_many :memories, dependent: :destroy
  devise :omniauthable, :omniauth_providers => [:facebook]
 
  has_many :children_with_memories, through: :memories, source: :child
  has_secure_password
  validates :password, presence: true, length: { minimum: 5 }, allow_nil: true
  validates :name, presence: true,  length:  { minimum: 2 }
  validates :email, presence: true, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }, length: { maximum: 40 }, uniqueness: {case_sensitive: false}


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    end      
  end
  
end
