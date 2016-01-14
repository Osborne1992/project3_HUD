class PrivateMessage < ActiveRecord::Base
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'

  scope :with, ->(user) { where("private_messages.sender_id = :id OR private_messages.recipient_id = :id", id: user.id) }


end
