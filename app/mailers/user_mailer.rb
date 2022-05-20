class UserMailer < ApplicationMailer
  def example(user)
    @user = user
    mail(to: @user.email, subject: 'Confirm your email')
  end
end
