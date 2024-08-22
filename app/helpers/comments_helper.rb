module CommentsHelper
  def format_date(comment)
    if comment.created_at_is_today?
      'Today'
    elsif comment.created_at_is_yesterday?
      'Yesterday'
    elsif comment.created_at_is_this_week?
      comment.created_at.strftime('%A')
    elsif comment.created_at_is_not_this_year?
      comment.created_at.strftime('%b %e, %Y')
    else
      comment.created_at.strftime('%b %e')
    end
  end

  def should_display_formatted_time_again?(comment)
    !comment.created_at_is_today? && !comment.created_at_is_yesterday? && comment.created_at_is_this_week?
  end
end
