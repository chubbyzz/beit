require 'rails_helper'

describe Make, type: :model do

  it {should have_many :models }

  it {should validate_uniqueness_of :name}

  it 'should search models after save' do
    make = build :make
    expect(make).to receive(:update_models_from_this_make)
    make.save
  end

  it 'should request the service to search new models' do
    make = create :make
    expect(ModelService).to receive(:update_from_webservice_by_make).with(make)
    make.update_models_from_this_make
  end
end