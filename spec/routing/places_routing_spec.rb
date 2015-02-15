require "rails_helper"

RSpec.describe PlacesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/places").to route_to("places#index")
    end
    it "routes to #show" do
      expect(:get => "/places/1").to route_to("places#show", :id => "1")
    end
  end
end
