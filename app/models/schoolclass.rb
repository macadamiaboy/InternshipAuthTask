class Schoolclass < ApplicationRecord
  belongs_to :school
  has_many :students

  validates :school_id, presence: true
end
