require 'rails_helper'

describe "Places" do
  it "if one is returned by the API, it is shown at the page" do
    allow(BeermappingApi).to receive(:places_in).with("kumpula").and_return(
      [ Place.new( name:"Oljenkorsi", id: 1 ) ]
    )

    visit places_path
    fill_in('city', with: 'kumpula')
    click_button "Search"

    expect(page).to have_content "Oljenkorsi"
  end

  it "if the API returns the number of beer places, all of them displayed on the page" do
   allow(BeermappingApi).to receive(:places_in).with("kumpula").and_return(
      [ Place.new( name:"Oljenkorsi", id: 1 ),
      	Place.new( name:"Test2", id: 2 ), 
      	Place.new( name:"Test3", id: 3 ) ]
    )
 

    visit places_path
    fill_in('city', with: 'kumpula')
    click_button "Search"
    
    expect(page).to have_content "Oljenkorsi"
    expect(page).to have_content "Test2"
    expect(page).to have_content "Test3"
	
  end

  it "if cannot find any place, it shows not found message " do
  	allow(BeermappingApi).to receive(:places_in).with("kumpula").and_return(
      []
    )

    visit places_path
    fill_in('city', with: 'kumpula')
    click_button "Search"
    expect(page).to have_content "No locations in"
  end
end