class MealMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(user)
    @user = user
    date = Date.current.to_formatted_s(:long_ordinal)
    mail(to: @user.email, subject: "Munchery alert for #{date}")
  end
end
