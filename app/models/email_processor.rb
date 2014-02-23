class EmailProcessor
  def self.process(email)
    #Message.create!({ to: email.to, from: email.from, subject: email.subject, body: email.body, raw_text: email.raw_text, raw_html: email.raw_html, raw_body: email.raw_body, headers: email.headers, raw_headers: email.raw_headers })

    @message = Message.new
    @message.to = email.to[0][:email]
    @message.from = email.from
    @message.subject = email.subject
    @message.body = email.body
    @message.save
  end
end
