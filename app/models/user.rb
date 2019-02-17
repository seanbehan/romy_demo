class User < ApplicationRecord
  include BCrypt

  validates :email, presence:true, format:/@/, uniqueness:true

  before_save do
    if self.password_changed?
      self.password = Password.create(self.password)
    end
  end

  def check_password
    Password.new(self.password)
  end
end
