# app/mailer/notifier.rb
class Notifier < ActionMailer::Base

  def contact_notification(sender)
    @sender = sender
    mail(:to => "mike.a.bragg@gmail.com",
         :from => sender.email,
         :subject => "sambragg.co.uk - New #{sender.support_type} Enquiry")
 end
end
