class BookClubMailer < ApplicationMailer

  def welcome_email(member)
    @member = member
    @url = 'http://example.com/login'
    mail(to: @member.user.email, subject: "Welcome to the #{@member.group.name} Book Club!")
  end
end
