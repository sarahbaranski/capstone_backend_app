class Student < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true

  has_many :shifts
  has_many :semesters, through: :shifts
  belongs_to :position

  def full_name
    "#{first_name} #{last_name}"
  end
end
