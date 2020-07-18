class User < ApplicationRecord
  has_one_attached :image
  before_save { self.email = email.downcase }
  before_save { self.tel_outside = tel_outside.gsub("-", "") }
  before_save { self.tel_mobile = tel_mobile.gsub("-", "") }

  HIRAGANA_REGEXP = /\A[\p{hiragana}[[:blank:]]\u{30fc}]+\z/

  validates :emproyee_id,
            presence: true,
            uniqueness: true,
            length: { is: 5 },
            format: { with: /\A[0-9\_]*\z/, message: " - 半角数字のみが使用できます" }

  validates :name,
            presence: true,
            length: { maximum: 60 }

  validates :name_kana,
            presence: false,
            length: { maximum: 255 },
            format: { with: HIRAGANA_REGEXP, message: " - ひらがなのみが使用できます", allow_blank: true }

  validates :location_name,
            presence: { message: " - 選択してください" }

  validates :position_name,
            presence: { message: " - 選択してください" }

  validates :email,
            length: { maximum: 254 },
            allow_nil: true,
            "valid_email_2/email": true

  validates :tel_extention,
            length: { is: 5 },
            format: { with: /\A[0-9]*\z/, message: " - 半角数字（６桁）のみが使用できます" }

  validates :tel_outside,
            length: { maximum: 20 },
            format: { with: /\A[0-9\-]*\z/, message: " - 半角数字のみが使用できます" }

  validates :tel_mobile,
            length: { maximum: 20 },
            format: { with: /\A[0-9\-]*\z/, message: " - 半角数字のみが使用できます" }

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
    begin
      ActiveRecord::Base.transaction do
        CSV.foreach(file.path, headers: true) do |row|
          user = new
          user.attributes = row.to_hash.slice(*csv_attributes)
          # bybug
          user.save!
        end
      end
    rescue => e
      logger.error("------------------------------------")
      logger.error("error: CSVファイル取り込みに失敗しました")
      logger.error("------------------------------------")
      logger.error e
      logger.error("------------------------------------")
      logger.error e.backtrace.join("\n")
      logger.error("------------------------------------")
      $import_errors = e.record.errors.messages
    end
  end

  # ransack
  def self.ransackable_attributes(auth_object = nil)
    %w[emproyee_id name name_kana email dept1 dept2 dept3 location_name location_name_kana position_name tel_extention tel_outside tel_mobile]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

end
