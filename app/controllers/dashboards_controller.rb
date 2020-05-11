require_relative '../services/restaurant_service'
require_relative '../services/dish_service'
require_relative '../services/accounting_service'

class DashboardsController < ApplicationController
  def index
    @restaurants = Restaurant.list
    @dishes = Dish.list
    @accountings = Accounting.list.first
  end
end
