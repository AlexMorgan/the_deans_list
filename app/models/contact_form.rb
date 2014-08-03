class ContactForm < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  validates :message, presence: true, length: { in: 30..300 }
end
