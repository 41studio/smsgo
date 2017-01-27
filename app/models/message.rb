# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  from       :string(255)
#  body       :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Message < ApplicationRecord
  validates :user, :from, :body, presence: true
  belongs_to :user
  delegate :name, :email, :phone_number, to: :user, prefix: true, allow_nil: true

  def save_and_return_notice
    if self.save
      self.send!
      "Your message successfully sent"
    else
      errors.full_messages.to_sentence
    end
  end

  def send!
    url = "https://rest.nexmo.com/sms/json"
    res = HTTP.post(url, params: {
        api_key: NEXMO_API_KEY,
        api_secret: NEXMO_API_SECRET,
        to: user_phone_number,
        from: from,
        text: body
      })
    puts res.to_s
  end
end
