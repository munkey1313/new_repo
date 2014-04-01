class FriendMailer < ActionMailer::Base
  default from: 'notifications@fantasyimmortals.com'
 
  def friend_mailer(user)
    @member = user
    @name = user.name
    @url  = 'http://162.144.84.38'
	    mail(to: @member.email, subject: 'Im on a boat')
  end
end
