$redis = Redis::Namespace.new("menu_api_overview:#{Rails.env}", redis: Redis.new)
