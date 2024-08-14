class CommentMailerPreview < ActionMailer::Preview
  def new_comment
    comment = Comment.last
    user = User.last
    actor = comment.user
    CommentMailer.with(comment: comment, user: user, actor: actor).new_comment
  end
end
