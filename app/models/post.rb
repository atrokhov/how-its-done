class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :subcategory
  has_many :comment, dependent: :destroy
end
