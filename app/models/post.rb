class Post < ApplicationRecord
    
    belongs_to :topic
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :votes, dependent: :destroy
    has_many :favorites, dependent: :destroy

    default_scope { order('rank DESC') }

    scope :order_by_title, -> { order('title DESC') }
    scope :order_by_reverse_created_at, -> { order('created_at ASC') }

    validates :title, length: { minimum: 5 }, presence: true
    validates :body, length: { minimum: 20 }, presence: true
    validates :topic, presence: true
    validates :user, presence: true

    post = Post.find(params[:favorites][:post_id])
    after_create :user.favorites.build(post: post)
    after_create :send_favorite_emails
    def up_votes
        votes.where(value: 1).count
    end
        
    def down_votes
        votes.where(value: -1).count
    end
        
    def points
        votes.sum(:value)
    end

    def update_rank
        age_in_days = (created_at - Time.new(1970,1,1)) / 1.day.seconds
        new_rank = points + age_in_days
        update_attribute(:rank, new_rank)
    end
    
    private

    def send_favorite_emails
    post.favorites.each do |favorite|
        FavoriteMailer.new_post(favorite.user, post, self).deliver_now
    end
    end
end
