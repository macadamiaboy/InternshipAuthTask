class School < ApplicationRecord
  has_many :schoolclasses
  has_many :students
end
