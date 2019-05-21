class User < ApplicationRecord
  before_save :downcase_email
  has_many :emotions

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                    length: { maximum: 200 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password # 生成時に確認、パスワードが空の場合は通さない
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  def downcase_email
    self.email.downcase!
  end
end
