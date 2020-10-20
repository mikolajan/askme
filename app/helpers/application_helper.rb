require 'sklonenie'

module ApplicationHelper
  def user_avatar(user)
    user.avatar_url.present? ? user.avatar_url : asset_pack_path('media/images/no_avatar.png')
  end
end
