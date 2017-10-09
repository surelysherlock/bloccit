class Post < ApplicationRecord
    belongs_to :topic
    has_many :comments, dependent: :destroy
    has_many :sponsored_posts
end
