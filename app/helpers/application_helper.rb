module ApplicationHelper
  def user_avatar(user)
    user.avatar_url || asset_path 'no_avatar.jpg'
  end
end
