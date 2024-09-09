module CommentsHelper
  def formatted_date(comment)
    if comment.created_today?
      'Today'
    elsif comment.created_yesterday?
      'Yesterday'
    elsif comment.created_this_week?
      local_time(comment.created_at, '%A')
    elsif !comment.created_this_year?
      local_time(comment.created_at, '%b %e, %Y')
    else
      local_time(comment.created_at, '%b %e')
    end
  end

  def display_time?(comment)
    comment.created_today? || comment.created_yesterday? || comment.created_this_week?
  end

  def user_profile_image(user)
    if user.profile_image.attached?
      image_tag url_for(user.resized_profile_image), class: "hidden lg:block size-14 rounded-full"
    else
      content_tag :svg, class: "hidden lg:block size-14 rounded-full bg-gray-50", viewBox: "0 0 24 24", fill: "currentColor" do
        tag.path(fill_rule: "evenodd", d: "M18.685 19.097A9.723 9.723 0 0 0 21.75 12c0-5.385-4.365-9.75-9.75-9.75S2.25 6.615 2.25 12a9.723 9.723 0 0 0 3.065 7.097A9.716 9.716 0 0 0 12 21.75a9.716 9.716 0 0 0 6.685-2.653Zm-12.54-1.285A7.486 7.486 0 0 1 12 15a7.486 7.486 0 0 1 5.855 2.812A8.224 8.224 0 0 1 12 20.25a8.224 8.224 0 0 1-5.855-2.438ZM15.75 9a3.75 3.75 0 1 1-7.5 0 3.75 3.75 0 0 1 7.5 0Z", clip_rule: "evenodd")
      end
    end
  end
end
