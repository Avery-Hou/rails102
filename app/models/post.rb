class Post < ApplicationRecord
	validates :content, presence: true

  	belongs_to :discuss_group
  	belongs_to :user
end
