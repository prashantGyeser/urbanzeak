class EmailProcessor
  def self.process(email)
    #Message.create!({ to: email.to, from: email.from, subject: email.subject, body: email.body, raw_text: email.raw_text, raw_html: email.raw_html, raw_body: email.raw_body, headers: email.headers, raw_headers: email.raw_headers })

    to = email.to[0][:email]

    @message = Message.new
    @message.to = to
    @message.from = email.from
    @message.subject = email.subject
    @message.body = email.body
    @message.conversation_id = to.partition('@').first
    @message.save
  end
end
