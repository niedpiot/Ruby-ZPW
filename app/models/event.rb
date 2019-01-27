class Event < ApplicationRecord
  has_many :tickets, dependent: :destroy

  validates :artist, presence: true
  validates :price_low, :price_high, numericality: { greater_than: 0 }
  validates :event_date, presence: true
  validate :should_have_correct_prices
  validate :date_cannot_be_past

  private

  def should_have_correct_prices
    return if price_low && price_high && price_low < price_high

    errors.add(:base, :invalid, message: 'price_low should be smaller than price_high')
  end

  def date_cannot_be_past
    return if event_date > Time.zone.today
    
    errors.add(:event_date, :invalid, message: 'Event cannot take place in the past')
  end
end
