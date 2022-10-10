# frozen_string_literal: true
class CreateRealStates < ActiveRecord::Migration[7.0]
  def change
    create_table(:real_states) do |t|
      t.string(:street_address)
      t.references(:city, null: true, foreign_key: true)
      t.string(:postcode)
      t.text(:building_description)
      t.string(:local_area_description)
      t.integer(:center_status)
      t.string(:product_name)
      t.string(:source_identifier)
      t.float(:total_building_size_sqm)
      t.integer(:min_desks)
      t.integer(:max_desks)
      t.integer(:min_term)
      t.decimal(:min_cost, precision: 10, scale: 2)
      t.integer(:area_size_unit, default: 1)
      # Images attributes
      t.text(:high_res_images)
      t.string(:external_building_image)
      t.string(:featured_image)

      t.timestamps
    end
  end
end
