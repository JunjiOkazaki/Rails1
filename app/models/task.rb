class Task < ApplicationRecord
  validates :title, presence: true 
  validates :start, presence: true
end
