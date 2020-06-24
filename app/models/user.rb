class User < ApplicationRecord
  has_one_attached :image

  HIRAGANA_REGEXP = /\A[\p{hiragana}[[:blank:]]\u{30fc}]+\z/

  validates :name,
            presence: true
  validates :name_kana,
            presence: false,
            length: { maximum: 255 },
            format: { with: HIRAGANA_REGEXP, message: "は、ひらがなで入力してください",allow_blank: true }
  validates :emproyee_id,
            presence: true,
            uniqueness: true,
            length: { is: 5 },
            format: { with: /\A[0-9\_]*\z/ }
  validates :email,
            length: { maximum: 254 },
            "valid_email_2/email": true
  validates :tel_extention,
            length: { is: 5 }
            # format: { with: /\A[0-9\_]*\z/ }
  validates :tel_outside,
            length: {maximum: 20 }
            # format: { with: /\A[0-9\_]*\z/ }
            # numericality: { only_integer: true, allow_blank: true }
  validates :tel_mobile,
            length: { maximum: 20 },
            format: { with: /\A[0-9\_]*\z/ }
            # numericality: { only_integer: true, allow_blank: true }
  scope :sort_by_name, -> { order(:name_kana, :name) }

  # CSV export
  def self.csv_attributes
    ["emproyee_id", "name", "name_kana", "address_name", "address_name_kana", "location_name", "location_name_kana", "dept1", "dept2", "dept3", "position_name", "email", "tel_extention", "tel_outside", "tel_mobile", "created_at", "updated_at"]
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
