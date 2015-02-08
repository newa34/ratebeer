require 'rails_helper'

describe "Beer" do 
  before :each do 
      FactoryGirl.create :user
  end

  let!(:brewery) { FactoryGirl.create :brewery, name:"Koff" }

  it "can be created with valid name" do
    sign_in(username:"Pekka", password:"Foobar1")

  	visit new_beer_path
  	fill_in('beer[name]', with: 'ISO')

  	expect{
  		click_button('Create Beer')
  	}.to change {Beer.count}.from(0).to(1)

  	expect(page).to have_content('Beer was successfully added')
  end


  it "cannot use invalid name" do
    sign_in(username:"Pekka", password:"Foobar1")
  	visit new_beer_path
  	fill_in('beer[name]', with:'')
  	click_button('Create Beer')

	expect(page).to have_content("Name can't be blank")
	expect(Beer.count).to eq(0)
  end

end