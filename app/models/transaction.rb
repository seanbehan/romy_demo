class Transaction < ApplicationRecord
  belongs_to :user

  validates :date, presence: true

  before_save do
    if amount_changed?
      self.amount = (self.amount_before_type_cast.to_s.gsub(/[^0-9\.]/, '').to_f * 100).to_i
    end
  end

  def amount_in_dollars
    (amount.to_f / 100)
  end

  def self.testr
    "HELLO"
  end
end
