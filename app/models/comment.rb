class Comment < ApplicationRecord
  belongs_to :topic
  validetes :content, presence: true
end
