class Survivor < ApplicationRecord
  validates :name, presence: true, length: { maximum: 42 }
  validates :birthdate, presence: true, format: { without: /\A[a-zA-Z]+\z/,
                                                  message: 'only allows numbers' }
  validates :gender, presence: true, length: { maximum: 10 }
  validates :latitude, presence: true, length: { maximum: 3 }
  validates :longitude, presence: true, length: { maximum: 3 }
  validates :reports_received, numericality: { only_integer: true }, allow_blank: true
end
