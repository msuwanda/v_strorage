class UserMailer < ActionMailer::Base
  default from: "from@example.com"

   def invite_email(user)
    @user = user
    @url  = 'http://localhost:3000/user/sigh_up'
    mail(to: @user, subject: 'email invite ')
   end

   def invite_group(user,url,send)
   	@usersend = send
   	@user = user
    @url  = url
    mail(to: @user, subject: 'email invite group')
   end
end
