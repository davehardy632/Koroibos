require 'rails_helper'

describe OlympianEvent do
  describe "Validations" do
    it {should validate_presence_of :medal}
    it {should validate_presence_of :games}
  end

  describe "Relationships" do
    it {should belong_to :olympian}
    it {should belong_to :event}
  end
end
