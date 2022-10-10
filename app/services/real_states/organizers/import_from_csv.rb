# frozen_string_literal: true

module RealStates
  module Organizers
    class ImportFromCsv
      include Interactor::Organizer

      before do
        context.fail!(message: "No file provided") if context.file_url.nil?
        context.fail!(
          message: "Invalid file, it has to be a CSV"
        ) unless context.file_url.include?(".csv")
      end

      organize(RealStates::Interactors::FetchData,
        RealStates::Interactors::CreateOrUpdate)
    end
  end
end
