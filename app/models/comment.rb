class Comment < ActiveRecord::Base
  belongs_to :post      #comment, posta aittir. 
  validates :post, presence: true
end
