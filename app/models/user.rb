class User < ApplicationRecord
  validates_presence_of :name, :email, :profile_picture

  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :friends
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def to_s
    name
  end
end
