class User < ApplicationRecord
  validates :name, presence: true
  validates :emproyee_id, presence: true, uniqueness: true,
            length: { is: 5 }, numericality: { only_integer: true }
end
