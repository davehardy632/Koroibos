require "rails_helper"

describe Sport do
  describe "Validations" do
    it {should validate_presence_of :sport}
  end

  describe "Relationships" do
    it {should have_many :events}
  end
end
