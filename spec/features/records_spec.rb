require 'rails_helper'

describe 'records pages' do
  describe 'records index', type: :feature do
    let!(:record_1) { FactoryBot.create(:record) }
    let!(:record_2) { FactoryBot.create(:record) }

    it 'displays a list of all records' do
      visit '/records'
      expect(page).to have_content('Record Collector')
      within('h1') do
        expect(page).to have_content('Records')
      end
      within('table#records') do
        expect(page).to have_content(record_1.title)
        expect(page).to have_content(record_2.title)
        expect(page).to have_content("Edit")
      end
    end
  end

  describe 'records create', type: :feature do
    let!(:artist) { FactoryBot.create(:artist) }
    it 'creates an record' do
      visit "/records"
      click_link "New Record"
      expect(page).to have_content('Record Collector')
      expect(page).to have_content("New Record")
      fill_in('record_title', with: 'Pony Party')
      select artist.name, from: "record_artist_id"
      select "1989", from: "record_year"
      select "Mint", from: "record_condition"
      select "Rock", from: "record_genre"
      click_button "Create Record"
      expect(page).to have_content("Record was successfully created.")
      expect(page).to have_content('Pony Party')
    end
  end

  describe 'records update', type: :feature do
    let!(:artist) { FactoryBot.create(:artist) }
    let!(:record_1) { FactoryBot.create(:record) }
    it 'edits the record' do
      visit "/records/#{record_1.id}/edit"
      expect(page).to have_content('Record Collector')
      expect(page).to have_content(record_1.genre.titleize)
      select "1989", from: "record_year"
      click_button "Update Record"
      expect(page).to have_content("Record was successfully updated.")
      expect(page).to have_content("1989")
    end
  end

  describe 'records destroy', type: :feature do
    let!(:record_1) { FactoryBot.create(:record) }
    let!(:record_2) { FactoryBot.create(:record, title: "OMG MAGIC") }

    it 'destroys an record' do
      visit '/records'
      expect(page).to have_content('Record Collector')
      within('h1') do
        expect(page).to have_content('Records')
      end
      within('table#records') do
        expect(page).to have_content(record_1.title)
        expect(page).to have_content(record_2.title)
        expect(page).to have_content("Edit")
      end
      click_link "record_#{record_1.id}_delete"
      expect(page).to have_content("Record was successfully destroyed.")
      expect(page).not_to have_content(record_1.title)
      expect(page).to have_content(record_2.title)
    end
  end
end