# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @slider_items = Book.for_slider.map(&:decorate)
    @best_sellers = Book.best_sellers.map(&:decorate)
  end
end
