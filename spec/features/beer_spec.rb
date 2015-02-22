require 'rails_helper'

describe "Beers" do 
  before :each do 
      FactoryGirl.create :user
      FactoryGirl.create :style

    sign_in(username:"Pekka", password:"Foobar1")
  end

  let!(:brewery) { FactoryGirl.create :brewery, name:"Koff" }

  it "can be created with valid name" do

  	visit new_beer_path
  	fill_in('beer_name', with: 'ISO')

  	expect{
  		click_button('Create Beer')
  	}.to change {Beer.count}.by(1)

  	expect(page).to have_content('Beer was successfully added')
  end


  it "cannot use invalid name" do

  	visit new_beer_path
  	fill_in('beer_name', with:'')
  	click_button('Create Beer')

	expect(page).to have_content("Name can't be blank")
	expect(Beer.count).to eq(0)
  end

end