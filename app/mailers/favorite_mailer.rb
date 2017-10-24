class FavoriteMailer < ApplicationMailer
  def new_post(user, post, comment)
    
        headers["In-Reply-To"] = "<post/#{post.id}@your-app-name.example>"
        headers["References"] = "<post/#{post.id}@your-app-name.example>"
    
        @user = user
        @post = post
    
        mail(to: user.email, subject: "New comment on #{post.title}")
      end
end
