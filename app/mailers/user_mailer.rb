class UserMailer < ApplicationMailer
  default from: 'example@gmail.com'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to my Movie review site')
  end

end
