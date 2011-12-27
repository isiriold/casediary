class Notifier < ActionMailer::Base

def email_notification(email, current_user,client_obj)
    recipients    client_obj.mail
    from          current_user.email
    subject       email.subject
    sent_on       Time.now
    reply_to      current_user.email
    content_type  "text/html"
    body          :email => email
end

=begin def forgot_password(user)
    @recipients ="#{user.mail_id}"
    @from     =  "admin@schoolit.com"
    @sent_on   = Time.now
    @subject  =  "New pasword of school it"
    @body[:user]  = user
    @body[:url] = "http://localhost:3000/login"
  end
=end  

end
