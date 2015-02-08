require 'rails_helper'

RSpec.describe Beer, type: :model do
  it "can be saved with name and style " do
  	beer = Beer.create name:"beer", style:"Weizen"

  	expect(beer).to be_valid
  end

  it "cannot be saved without name" do
  	beer = Beer.create style:"Weizen"

  	expect(beer).not_to be_valid
  end

  it "cannot be saved without style" do
  	beer = Beer.create name:"beer"

  	expect(beer).not_to be_valid
  end
  
end

