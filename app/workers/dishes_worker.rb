class DishesWorker
  include Sneakers::Worker
  # This worker will connect to "menu_dashboard.dishes" queue
  # env is set to nil since by default the actuall queue name would be
  # "menu_dashboard.dishes_development"
  from_queue "menu_dashboard.dishes", env: nil

  # work method receives message payload in raw format
  def work(raw_dish)
    Dish.push(raw_dish)
    ack! # we need to let queue know that message was received
  end
end
