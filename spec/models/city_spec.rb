# frozen_string_literal: true

require "rails_helper"

RSpec.describe(City, type: :model) do
  describe "validations" do
    it { is_expected.to(validate_presence_of(:name)) }
  end

  describe ".to_s" do
    let!(:city) { create(:city) }
    it "returns the city name" do
      expect(city.to_s).to(eq(city.name))
    end
  end
end
