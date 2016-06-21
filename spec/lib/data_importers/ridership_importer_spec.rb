require "rails_helper"
require "tempfile"

RSpec.describe DataImporters::RidershipImporter do

  before(:all) do
    @ridership = RidershipImporter.all
    @ridership.each {|b| b.destroy}
  end

  after(:all) do
    @ridership = Ridership.all
    @ridership.each {|b| b.destroy}
  end


  describe "import" do 

    it "loads the database with " do 
      expect(2).to eq 1 
    end
  end
end