# frozen_string_literal: true
class RealState < ApplicationRecord
  belongs_to :city, optional: true

  validates :source_identifier, presence: true, uniqueness: true
  validates :city, :postcode, presence: true, if: :already_created?

  enum center_status: {
    active: 1,
    inactive: 2,
  }

  enum area_size_unit: {
    sqm: 1,
  }

  private

  def already_created?
    self.persisted?
  end
end
