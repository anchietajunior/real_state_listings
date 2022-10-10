# frozen_string_literal: true
require "rails_helper"

RSpec.describe(RealState, type: :model) do
  describe "validations" do
    context "non persisted record" do
      let!(:unique_real_state) { create(:real_state, source_identifier: "560-01929") }

      it "is not valid without a source identifier" do
        real_state = RealState.new
        expect(real_state.valid?).to(eq(false))
      end

      it "is valid with a unique source identifier" do
        real_state = RealState.find_or_initialize_by(source_identifier: "560-019299")
        expect(real_state.valid?).to(eq(true))
      end

      it "is not valid with a duplicated source identifier" do
        real_state = RealState.new
        real_state.source_identifier = "560-01929"
        expect(real_state.valid?).to(eq(false))
      end
    end

    context "persisted record" do
      let!(:real_state) { create(:real_state) }

      it "is not valid without the required attributes" do
        real_state.postcode = "435768"
        expect(real_state.valid?).to(eq(false))
      end
    end
  end

  describe "relationships" do
    it { is_expected.to(belong_to(:city).optional)}
  end
end
