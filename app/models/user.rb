class User < ApplicationRecord
  def self.csv_attributes
    ["name", "emproyee_id", "email", "tel_extention", "tel_outside"]
  end

  def self.generate_csv
    CSV.generate(headers: true) do |csv|
      csv << csv_attributes
      all.each do |user|
        csv << csv_attributes.map{|attr| user.send(attr)}
      end
    end
  end

  has_one_attached :image
  validates :name, presence: true
  validates :emproyee_id, presence: true, uniqueness: true, limit: 2,
            length: { is: 5 }, numericality: { only_integer: true }
  validates :email, presence: true, "valid_email_2/email": true,
            uniqueness: { case_sensitive: false }
  validates :tel_extention, length: { maximum: 5 }, numericality: { only_integer: true }
  validates :tel_outside, numericality: { only_integer: true }
  validates :tel_mobile, numericality: { only_integer: true }, format: {with: /\A\d{11}\z/}
  scope :sort_by_name, -> { order(:name) }

  def self.ransackable_attributes(auth_object = nil)
    %w[name name_kana email dept1 dept2 dept3 location_name position_name]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

end
