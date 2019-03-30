class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :discuss_groups
  has_many :posts

  has_many :discuss_group_relationships
  has_many :participated_discuss_groups, through: :discuss_group_relationships, source: :discuss_group
end
