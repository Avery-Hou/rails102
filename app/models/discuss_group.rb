class DiscussGroup < ApplicationRecord
	validates :title, presence: true

	belongs_to :user
	has_many :posts

	has_many :discuss_group_relationships
	has_many :members, through: :discuss_group_relationships, source: :user
end
