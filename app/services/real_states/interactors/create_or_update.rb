# frozen_string_literal: true
module RealStates
  module Interactors
    class CreateOrUpdate
      include Interactor

      SQM = 10.764

      delegate :csv_content, to: :context

      def call
        context.fail!(message: "File is empty") if csv_content.empty?

        csv_content.each do |line|
          next if invalid_line?(line)

          create_or_update_real_state(line)
        end
      end

      private

      def invalid_line?(line)
        line["center_status"] != "ACTIVE" ||
          line["product_name"] != "Long Term Office - 1 Workstation" ||
          line["total_building_size"] == nil
      end

      def create_or_update_real_state(line)
        real_state = RealState.find_or_create_by(source_identifier: source_identifier(line))
        real_state.update(real_state_params(line))
      end

      def real_state_params(line)
        {}.tap do |hash|
          hash[:street_address] = line["address_line1"]
          hash[:city] = city(line["city"])
          hash[:postcode] = line["zip_or_postal_code"]
          hash[:building_description] = line["building_description"]
          hash[:local_area_description] = line["local_area_description"]
          hash[:external_building_image] = line["external_building_image"]
          hash[:featured_image] = line["featured_image"]
          hash[:area_size_unit] = "sqm"
          hash[:high_res_images] = images(line)
          hash[:min_desks] = 80
          hash[:max_desks] = 1100
          hash[:min_term] = 1
          hash[:min_cost] = (line["min_cost"].to_f / 80) * 12
          hash[:center_status] = "active"
          hash[:product_name] = line["product_name"]
          hash[:total_building_size_sqm] = line["total_building_size"] * SQM
        end
      end

      def source_identifier(line)
        "#{line["centre_id"]}-#{line["zip_or_postal_code"]}"
      end

      def city(name)
        City.find_or_create_by(name: name)
      end

      def images(line)
        "#{line["featured_image"]},#{line["high_res_images"]},#{line["external_building_image"]}"
      end
    end
  end
end
