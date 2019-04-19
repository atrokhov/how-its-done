class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :comment, dependent: :destroy
  has_many :post
  has_many :likes, dependent: :destroy
  has_many :dislikes, dependent: :destroy
end
