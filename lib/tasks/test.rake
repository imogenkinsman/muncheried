namespace :test do

  desc 'sends a test email'
  task :email => :environment do
    user = User.find_by email: 'jade@thezets.com'
    MealMailer.alert_email(user).deliver
  end

end