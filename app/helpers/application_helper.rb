module ApplicationHelper
  def user_avatar(user)
    user&.avatar_url || asset_pack_path('media/images/no_avatar.png')
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end
end
