# frozen_string_literal: true

module RealStates
  module Interactors
    class FetchData
      include Interactor

      delegate :file_url, to: :context

      def call
        context.csv_content = CSV.parse(data.body, headers: true)
      rescue StandardError => e
        context.fail!(message: "The data from CSV could not be fetched")
      end

      private

      def data
        @data ||= HTTParty.get(file_url)
      end
    end
  end
end
