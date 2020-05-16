class User < ApplicationRecord
  validates :name, presence: true
  validates :emproyee_id, presence: true, uniqueness: true,
            length: { is: 5 }, numericality: { only_integer: true }

  scope :sort_by_id, -> { order(:emproyee_id) }
  scope :sort_by_name, -> { order(:name) }

  def self.ransackable_attributes(auth_object = nil)
    %w[name dept1]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
