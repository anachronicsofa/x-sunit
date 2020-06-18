class Survivor < ApplicationRecord
  validates :name, presence: true, length: { maximum: 42 }
  validates :birthdate, presence: true, format: { without: /\A[a-zA-Z]+\z/,
                                                  message: 'only allows numbers' }
  validates :gender, presence: true, length: { maximum: 10 }
  validates :latitude, presence: true, length: { maximum: 5 }
  validates :longitude, presence: true, length: { maximum: 5 }
  validates :reports_received, numericality: { only_integer: true }, allow_blank: true

  def self.report_abducted
    (Survivor.where(abducted: true).size / Survivor.all.size) * 100
  end

  def self.report_non_abducted
    (Survivor.where(abducted: false).size / Survivor.all.size) * 100
  end

  def reporting(reporter_id)
    @reporting = Survivor.find(reporter_id)
    if (reporter_id == id) || (@reporting.abducted == true)
      false
    else
      self.reports_received += 1
      self.abducted = true if self.reports_received >= 3
      save
      true
    end
  end
end
