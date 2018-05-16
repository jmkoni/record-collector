require 'rails_helper'

describe 'artists pages' do
  describe 'artists index', type: :feature do
    let!(:artist_1) { FactoryBot.create(:artist) }
    let!(:artist_2) { FactoryBot.create(:artist) }

    it 'displays a list of all artists' do
      visit '/artists'
      expect(page).to have_content('Record Collector')
      within('h1') do
        expect(page).to have_content('Artists')
      end
      within('table#artists') do
        expect(page).to have_content(artist_1.name)
        expect(page).to have_content(artist_2.name)
        expect(page).to have_content("Edit")
      end
    end

    it 'exports csv' do
      visit '/artists'
      click_link 'By Name Ascending'
      header = page.response_headers['Content-Disposition']
      expect(header).to match /^attachment/
      expect(header).to match /filename="artist-overview-#{Date.today}.csv"$/
    end
  end

  describe 'artists create', type: :feature do
    it 'creates an artist' do
      visit "/artists"
      click_link "New Artist"
      expect(page).to have_content('Record Collector')
      expect(page).to have_content("New Artist")
      fill_in('artist_name', with: 'Pony Party')
      select "Band", from: "artist_band_type"
      click_button "Create Artist"
      expect(page).to have_content("Artist was successfully created.")
      expect(page).to have_content('Pony Party')
    end
  end

  describe 'artists update', type: :feature do
    let!(:artist_1) { FactoryBot.create(:artist) }
    it 'edits the artist' do
      visit "/artists/#{artist_1.id}/edit"
      expect(page).to have_content('Record Collector')
      expect(page).to have_content(artist_1.band_type.titleize)
      fill_in('artist_name', with: 'Pony Party')
      click_button "Update Artist"
      expect(page).to have_content("Artist was successfully updated.")
      expect(page).to have_content('Pony Party')
    end
  end

  describe 'artists destroy', type: :feature do
    let!(:artist_1) { FactoryBot.create(:artist) }
    let!(:artist_2) { FactoryBot.create(:artist, name: "OMG MAGIC") }

    it 'destroys an artist' do
      visit '/artists'
      expect(page).to have_content('Record Collector')
      within('h1') do
        expect(page).to have_content('Artists')
      end
      within('table#artists') do
        expect(page).to have_content(artist_1.name)
        expect(page).to have_content(artist_2.name)
        expect(page).to have_content("Edit")
      end
      click_link "artist_#{artist_1.id}_delete"
      expect(page).to have_content("Artist was successfully destroyed.")
      expect(page).not_to have_content(artist_1.name)
      expect(page).to have_content(artist_2.name)
    end
  end

  describe 'artists records', type: feature do
    let!(:artist_1) { FactoryBot.create(:artist) }
    let!(:artist_2) { FactoryBot.create(:artist, name: "OMG MAGIC") }
    let!(:record) { FactoryBot.create(:record, artist: artist_2)}

    it 'shows artist records' do
      visit 'artists'
      expect(page).to have_content('Record Collector')
      within('h1') do
        expect(page).to have_content('Artists')
      end
      click_link "artist_#{artist_2.id}_records"
      expect(page).to have_content("Records by #{artist_2.name}")
      expect(page).to have_content(record.title)
    end
  end
end