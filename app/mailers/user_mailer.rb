class UserMailer < ActionMailer::Base
  default from: "beer@beer.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.activation_needed_email.subject
  #
  def activation_needed_email(user)
    @user = user
    @url = "http://0.0.0.0:3000/users/#{user.activation_token}/activate"

    mail(to: user.email, subject: "Please Activate Your Account - Project Beer")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.activation_success_email.subject
  #
  def activation_success_email(user)
    @user = user
    @url = "http://0.0.0.0:3000/login"
    mail(to: user.email, subject: "Your account is now activated")
  end

  #User mailer to confirm their beer selection.
  def subscription_confirm(user)
    @user = user
    mail(to: user.email, subject: "Thank you for subscribing!")
  end
end
