# frozen_string_literal: true
class RealStatesController < ApplicationController

  before_action :load_real_state, only: [:show]

  def index
    @pagy, @real_states = pagy(RealState.all.order(:created_at))
  end

  def show; end

  private

  def load_real_state
    @real_state = RealState.find(params[:id])
  end
end
