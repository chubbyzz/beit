require 'rails_helper'

describe Model, type: :model do
  it {should belong_to :make}

  it {should validate_uniqueness_of :name }
end