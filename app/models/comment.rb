class Comment < ApplicationRecord
  belongs_to :topic, optional: true
  belongs_to :user
  validates :content, presence: true, length: { maximum: 200 }
end
