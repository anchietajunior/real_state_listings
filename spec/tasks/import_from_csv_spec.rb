# frozen_string_literal: true
require "rails_helper"
Rails.application.load_tasks

RSpec.describe("Task import_from_csv") do
  describe "rails import_from_csv" do
    it "calls the import from csv organizer" do
      expect(RealStates::Organizers::ImportFromCsv).to(receive(:call))
      Rake::Task["import_from_csv"].invoke
    end
  end
end
