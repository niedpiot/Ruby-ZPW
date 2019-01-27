class Ticket < ApplicationRecord
  belongs_to :event, optional: true
  belongs_to :user, optional: true

  validates :name, presence: true, length: { minimum: 2, maximum: 30 }
  validates :email_address, presence: true, email: true
  validates :price, numericality: { greater_than: 0 }
end
