class Artist < ApplicationRecord
  has_many :records
  validates :name, presence: true
  enum band_type: [:solo, :band]

  def num_records
    records.count
  end

  def year_range
    record_years = records.pluck(:year)
    "#{record_years.min} - #{record_years.max}"
  end

  def common_word
    record_string = records.pluck(:title).join(" ").downcase
    most_common(record_string)
  end

  private
  def most_common(string)
    words = string.downcase.tr(",.?!",'').split(' ')
    counts = words.each_with_object(Hash.new(0)) { |e, h| h[e] += 1 }
    max_quantity = counts.values.max
    counts.select { |k, v| v == max_quantity }.keys.first
  end
end
