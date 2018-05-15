require 'rails_helper'

describe Artist do
  context 'associations' do
    it { should have_many :records }
  end

  context 'validations' do
    it { should define_enum_for(:band_type)
      .with(:solo, :group) }
    it { should validate_presence_of :name }
  end
end
