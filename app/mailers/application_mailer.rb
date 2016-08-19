class ApplicationMailer < ActionMailer::Base
  default from: "info@example.com"

  def welcome_email(user)
    @user = user
    email_with_name = %("#{@user.first_name} #{@user.last_name}" <#{@user.email}>)
    @url = signin_url
    mail(to: @user.email, subject: 'Welcome to Jobber!')
  end
end
