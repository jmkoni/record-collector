require 'rails_helper'

describe Record do
  context 'associations' do
    it { should belong_to :artist }
  end

  context 'validations' do
    it { should define_enum_for(:media_condition)
      .with(:mint, :near_mint, :very_good_plus, :very_good,
            :good_plus, :good, :fair, :poor) }
    it { should define_enum_for(:sleeve_condition)
      .with(:mint, :near_mint, :very_good_plus, :very_good,
            :good_plus, :good, :fair, :poor) }
    it { should define_enum_for(:genre)
      .with(:rock, :pop, :electronic, :folk, :world, :country,
            :jazz, :funk, :soul, :hip_hop, :classical, :latin,
            :reggae, :stage_and_screen, :blues, :non_music, :rap) }
    it { should validate_presence_of :artist }
    it { should validate_presence_of :title }
    it { should validate_presence_of :year }
  end
end
