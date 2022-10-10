# frozen_string_literal: true
FactoryBot.define do
  factory :real_state do
    source_identifier { "567-987867" }

    trait :with_all_attributes do
      street_address { Faker::Address.street_address }
      city
      building_description do
        "The business center is located in the Brandywine Building"\
          "at the heart of the downtown area"
      end
      postcode { Faker::Address.postcode }
    end
  end
end
