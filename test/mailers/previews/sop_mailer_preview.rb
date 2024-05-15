# Preview all emails at http://localhost:3000/rails/mailers/check_list_mailer
class SopMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/check_list_mailer/check_list
  def sop
    sop = SopEmail.last
    SopMailer.sop(sop.email, sop.name)
  end

end
