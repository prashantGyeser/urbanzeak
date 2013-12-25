class EmailProcessor
  def self.process(email)
    Message.create!({ message: email.body, email: email.from })
  end
end