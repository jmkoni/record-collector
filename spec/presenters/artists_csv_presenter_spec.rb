require 'rails_helper'

describe ArtistsCsvPresenter do
  context '#to_csv' do
    let(:artists) { Array.new(5) { FactoryBot.create(:artist) } }
    before do
      titles = ["Thriller", "Back in Black", "The Dark Side of the Moon", "Bat Out of Hell", "The Bodyguard", "Their Greatest Hits (1971–1975)", "Saturday Night Fever", "Rumours", "Grease: The Original Soundtrack from the Motion Picture", "Led Zeppelin IV", "Bad", "Jagged Little Pill", "Come On Over", "Falling into You", "Sgt. Pepper's Lonely Hearts Club Band", "Hotel California", "Dirty Dancing", "21", "Let's Talk About Love", "1", "Gold: Greatest Hits", "Dangerous", "The Immaculate Collection", "Abbey Road", "Born in the U.S.A.", "Brothers in Arms", "Titanic: Music from the Motion Picture", "Metallica", "Nevermind", "The Wall", "Supernatural", "Appetite for Destruction", "Slippery When Wet", "Music Box"]
      artists.each do |artist|
        (1..3).to_a.sample.times do
          FactoryBot.create(:record, artist: artist, year: (1955..2018).to_a.sample, title: titles.sample)
        end
      end
    end
    it 'renders a csv' do
      csv = ArtistsCsvPresenter.to_csv(Artist.all)
      aggregate_failures 'csv contents' do
        expect(csv).to include 'name,num_records,year_range,common_word'
        artists.each do |artist|
          expect(csv).to include artist_to_string(artist)
        end
      end
    end
  end
end

def artist_to_string(artist)
  "#{artist.name},#{artist.num_records}," \
    "#{artist.year_range},#{artist.common_word}"
end