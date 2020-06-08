class User < ApplicationRecord
  has_one_attached :image
  validates :name,
            presence: true
  validates :emproyee_id,
            presence: true,
            uniqueness: true,
            length: { is: 5 }
            # numericality: { only_integer: true },
            # format: { with: /\A[0-9\_]*\z/ }
            # sprintf: { '%05d', 10 }
  validates :email,
            "valid_email_2/email": true
            # uniqueness: { case_sensitive: false }
  validates :tel_extention,
            length: { maximum: 5 }
            # numericality: { only_integer: true }
  validates :tel_outside,
            length: { maximum: 10 },
            numericality: { only_integer: true }
  validates :tel_mobile,
            length: { maximum: 11 }
            # numericality: { only_integer: true }, format: {with: /\A\d{11}\z/}
  scope :sort_by_name, -> { order(:name_kana, :name) }

  # CSV export
  def self.csv_attributes
    ["emproyee_id", "name", "name_kana", "zip_number", "address_name", "address_name_kana", "location_name", "location_name_kana", "dept1", "dept2", "dept3", "position_name", "tel_extention", "tel_outside", "tel_mobile", "created_at", "updated_at"]
  end

  def self.generate_csv
    CSV.generate(headers: true) do |csv|
      csv << csv_attributes
      all.each do |user|
        csv << csv_attributes.map{|attr| user.send(attr)}
      end
    end
  end

  # CSV import
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      user = new
      user.attributes = row.to_hash.slice(*csv_attributes)
      user.save!
    end
  end

  # ransack
  def self.ransackable_attributes(auth_object = nil)
    %w[name name_kana email dept1 dept2 dept3 location_name position_name]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

end
