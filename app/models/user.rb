class User < ApplicationRecord
  has_one_attached :image
  validates :name, presence: true
  validates :emproyee_id, presence: true, uniqueness: true,
            length: { is: 5 }, numericality: { only_integer: true }

  scope :sort_by_name, -> { order(:name) }
  scope :sort_by_name, -> { order(:name) }

  def self.ransackable_attributes(auth_object = nil)
    %w[name dept1]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
