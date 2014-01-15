class EmailProcessor
  def self.process(email)
    Message.create!({ to: email.to, from: email.from, cc: email.cc, subject: email.subject, body: email.body, raw_text: email.raw_text, raw_html: email.raw_html, raw_body: email.raw_body, headers: email.headers, raw_headers: email.raw_headers })
  end
end
