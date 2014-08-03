class UserMailer < ActionMailer::Base
  default from: "deanslistproject@gmail.com"

  def contact_form(name, email, subject, message)
    @name = name
    @email = email
    @subject = subject
    @message = message

    mail(to: 'alexmorgan.am@gmail.com', subject: "#{@name} has contacted you")
  end
end
