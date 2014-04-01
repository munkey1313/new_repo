class LeagueMailer < ActionMailer::Base
  default from: 'pjvea13@gmail.com'
 
  def league_mailer(user)
    @member = user.member
    @league = user.name
    @url  = 'http://162.144.84.38'
	    mail(to: @member.email, subject: 'Im on a boat')
  end
end
