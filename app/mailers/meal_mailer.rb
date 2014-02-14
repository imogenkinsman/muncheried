class MealMailer < ActionMailer::Base
  default from: "noreply@munchalert.com"

  def alert_email(user)
    @meals = Meal.available
    date = Date.current.to_formatted_s(:long_ordinal)
    mail(to: user.email, subject: "Munchery alert for #{date}")
    user.update(emailed_at: DateTime.now)
  end
end
