class LeagueMailer < ActionMailer::Base
  default from: 'pjvea13@gmail.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'http://162.144.84.38'
    mail(to: @user.email, subject: 'Im on a boat')
  end
  # LeagueMailer.welcome_email(:member).deliver
end
