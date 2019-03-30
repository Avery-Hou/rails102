class DiscussGroupRelationship < ApplicationRecord
  belongs_to :discuss_group
  belongs_to :user
end
