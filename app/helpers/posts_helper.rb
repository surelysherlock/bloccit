module PostsHelper
  def user_is_authorized_for_post?(post)
    current_user &&  current_user.admin?
  end

  def user_has_no_posts?
    current_user.posts.count == 0
  end
end
