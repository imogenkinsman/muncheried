class MealMailer < ActionMailer::Base
  default from: "noreply@munchalert.com"

  def alert_email(user)
    @user = user
    @meals = Meal.where('created_at > ?', 1.day.ago)
    date = Date.current.to_formatted_s(:long_ordinal)
    mail(to: @user.email, subject: "Munchery alert for #{date}")
  end
end
