class ReplyMailer < ActionMailer::Base
  def host_reply(message)
    @body = message.body
    mail(:to => message.to, :from => message.from)
  end
end
