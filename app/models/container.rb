class Container < ApplicationRecord
  belongs_to :voyage, optional: true
  # validates :number, uniqueness: true
  # before_create :check_by_number 
  # def check_by_number

  # end 
end
