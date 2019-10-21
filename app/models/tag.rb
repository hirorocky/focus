class Tag < ApplicationRecord
  belongs_to :user
  has_many :fragments
  has_many :emotions, through: :fragments

  validates :name, presence: true,
                   length: { maximum: 10 },
                   uniqueness: { case_sensitive: false }
end
