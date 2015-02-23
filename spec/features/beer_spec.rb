require 'rails_helper'

describe "Beers" do 
  before :each do 
      FactoryGirl.create(:user)
      FactoryGirl.create(:brewery)
      FactoryGirl.create(:style)
    sign_in(username:"Pekka", password:"Foobar1")
  end


  it "can be created with valid name" do
  	visit new_beer_path
  	fill_in('beer_name', with: 'ISO')
    select('Lager', :from => 'Style')

  	expect{
  		click_button('Create Beer')
  	}.to change {Beer.count}.by(1)
  end


  it "cannot use invalid name" do

  	visit new_beer_path
  	fill_in('beer_name', with:'')
  	click_button('Create Beer')

	expect(page).to have_content("Name can't be blank")
  end

end