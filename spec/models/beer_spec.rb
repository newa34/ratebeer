require 'rails_helper'

RSpec.describe Beer, type: :model do
  it "can be saved with name and style " do
    style = Style.create name:"style", description:"styledesc"
  	beer = Beer.create name:"beer", style: style

  	expect(beer).to be_valid
  end

  it "cannot be saved without name" do
    style = Style.create name:"style", description:"styledesc"
  	beer = Beer.create style:style

  	expect(beer).not_to be_valid
  end

  it "cannot be saved without style" do
  	beer = Beer.create name:"beer"

  	expect(beer).not_to be_valid
  end
  
end

