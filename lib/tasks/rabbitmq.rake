namespace :rabbitmq do
  desc "Setup routing"
  task :setup do
    require "bunny"

    conn = Bunny.new.tap(&:start)

    ch = conn.create_channel
    x  = ch.headers("headers")

    queue_restaurants = ch.queue("menu_dashboard.restaurants", durable: true)
    queue_dishes = ch.queue("menu_dashboard.dishes", durable: true)

    # bind queue to exchange
    queue_restaurants.bind("crawler.restaurants")
    queue_dishes.bind("crawler.dishes")

    conn.close
  end
end
