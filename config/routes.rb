# frozen_string_literal: true
Rails.application.routes.draw do
  resources :real_states, only: [:index, :show]
  root "real_states#index"
end
