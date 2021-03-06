class Dish
  KEY = "dish"
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
  def self.push(raw_dish)
    datas = JSON.parse(raw_dish)
    broadcast_to_datas(datas)
    $redis.lpush(KEY, raw_dish)
    $redis.ltrim(KEY, 0, STORE_LIMIT-1)
  end

  private

  def self.broadcast_to_datas(datas)
    ActionCable.server.broadcast 'datas',
      type: KEY,
      name: datas['title'],
      price: datas['price'],
      description: datas['description']
  end
end
