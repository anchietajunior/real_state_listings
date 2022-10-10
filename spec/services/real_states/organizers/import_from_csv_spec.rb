# frozen_string_literal: true

require "rails_helper"

RSpec.describe(RealStates::Organizers::ImportFromCsv) do
  subject { described_class.call(file_url: file_url) }

  describe "#call", :vcr do
    context "failure" do
      context "when no file is provided" do
        let(:file_url) { nil }
        it "returns a no file message" do
          expect(subject.message).to(eq("No file provided"))
          expect(subject.success?).to(eq(false))
        end
      end

      context "when an invalid file is provided" do
        let(:file_url) { "http://gist.githubusercontent.com/anchietajunior/listings.pdf" }
        it "returns an invalid file message" do
          expect(subject.message).to(eq("Invalid file, it has to be a CSV"))
          expect(subject.success?).to(eq(false))
        end
      end

      context "when file is empty" do
        let(:file_url) {
 "https://gist.githubusercontent.com/anchietajunior/d3e7409b9ca3092b18bee854562bff69/raw/7e5d5e5720f6a6ed0bf9ac4937c2bfe8ba17f422/listings.csv" }

        it "returns an empty file message" do
          expect(subject.message).to(eq("File is empty"))
          expect(subject.success?).to(eq(false))
        end
      end
    end

    context "success" do
      context "when csv contains valid, duplicated and invalid lines" do
        let(:file_url) {
 "https://gist.githubusercontent.com/anchietajunior/4e7c0237f8973d2e1deb34fb192f6ef0/raw/f232dda1d28f31ea2ed9ae08f6fe4309e62865dc/listings2.csv" }

        it "creates two new real states" do
          expect { subject }.to(change { RealState.count }.by(2))
        end
      end

      context "when csv contains only invalid data lines" do
        let(:file_url) {
 "https://gist.githubusercontent.com/anchietajunior/fb6f91338842b0a66177e86052957d25/raw/aa4daa8c9c9448ecde7da2bc2fdbd992fca07cd6/listings3.csv" }

        it "does not create any real state" do
          expect { subject }.to(change { RealState.count }.by(0))
        end
      end
    end
  end
end
