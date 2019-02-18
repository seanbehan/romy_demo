class User < ApplicationRecord
  include BCrypt

  has_many :transactions

  validates :email, presence:true, format:/@/, uniqueness:true
  validates :password, presence:true

  before_save do
    if self.password_changed? && self.password.present?
      self.password = Password.create(self.password)
    end

    self.income = (self.income_before_type_cast.to_s.gsub(/[^0-9\.]/, '').to_f * 100).to_i if income_changed?
    self.budget = (self.budget_before_type_cast.to_s.gsub(/[^0-9\.]/, '').to_f * 100).to_i if budget_changed?
    self.expenses = (self.expenses_before_type_cast.to_s.gsub(/[^0-9\.]/, '').to_f * 100).to_i if expenses_changed?
  end

  def check_password
    Password.new(self.password)
  end

  def profile_complete?
    income > 0 && budget > 0
  end

  def balance
    (income_in_dollars - expenses_in_dollars)
  end

  def income_in_dollars
    income.to_f / 100
  end
  def budget_in_dollars
    budget.to_f / 100
  end
  def expenses_in_dollars
    expenses.to_f / 100
  end
end
