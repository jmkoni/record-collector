require 'csv'

class ArtistsCsvPresenter
  REQ_HEADERS = %w[name num_records year_range common_word].freeze

  def self.create_artist_hash(records)
    hash = []
    records.each do |record|
      row = generate_row(record)
      hash << row
    end
    hash.sort_by { |a| a['id'] }
  end

  def self.to_csv(records)
    CSV.generate do |csv|
      records = records.to_a
      hash_records = create_artist_hash(records)
      csv << REQ_HEADERS
      hash_records.each do |cer|
        csv << cer.values_at(*REQ_HEADERS)
      end
    end
  end

  private_class_method

  def self.generate_row(record)
    row = {}
    REQ_HEADERS.each do |head|
      row[head] = record.send(head.to_sym)
    end
    row
  end
end