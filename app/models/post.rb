class Post < ApplicationRecord
    belongs_to :topic
    has_many :comments, dependent: :destroy
    has_many :sponsored_posts

    validates :title, length: { minimum: 5 }, presence: true
    validates :body, length: { minimum: 20 }, presence: true
    validates :topic, presence: true
end
