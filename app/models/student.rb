class Student < ApplicationRecord
  belongs_to :school
  belongs_to :schoolclass

  #No length check in case of korean students)
  validates :first_name, presence: true
  validates :surname, presence: true
  validates :school_id, presence: true
  validates :schoolclass_id, presence: true

end
