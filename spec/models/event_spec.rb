require 'rails_helper'

describe Event do
  describe "Validations" do
    it {should validate_presence_of :event}
  end

  describe "Relationships" do
    it {should have_many :olympian_events}
    it {should have_many(:olympians).through(:olympian_events)}
    it {should belong_to :sport}
  end
end
