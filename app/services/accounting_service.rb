class Accounting
  KEY = "accounting"
  STORE_LIMIT = 10

  # Get list of recent posts from redis
  # Since redis stores data in binary text format
  # we need to parse each list item as JSON
  def self.list(limit = STORE_LIMIT)
    $redis.lrange(KEY, 0, limit).map do |raw_dish|
      JSON.parse(raw_dish)
    end
  end

  # Push new post to list and trim it's size
  # to limit required storage space
  # `raw_post` is already a JSON string
  # so there is no need to encode it as JSON
  def self.push(raw_accounting)
    datas = JSON.parse(raw_accounting)
    broadcast_to_datas(datas)
    $redis.lpush(KEY, raw_accounting)
    $redis.ltrim(KEY, 0, STORE_LIMIT-1)
  end

  private

  def self.broadcast_to_datas(datas)
    ActionCable.server.broadcast 'datas',
      type: 'accounting',
      dish_count: datas['dish_count'],
      restaurant_count: datas['restaurant_count']
  end
end
