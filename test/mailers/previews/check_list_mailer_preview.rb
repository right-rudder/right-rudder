# Preview all emails at http://localhost:3000/rails/mailers/check_list_mailer
class CheckListMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/check_list_mailer/check_list
  def check_list
    checklist = ChecklistEmail.last
    CheckListMailer.check_list(checklist.email, checklist.name)
  end

end
