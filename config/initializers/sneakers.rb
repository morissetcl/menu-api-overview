Sneakers.configure({})
Sneakers.logger.level = Logger::INFO # the default DEBUG is too noisy

require_relative '../../app/workers/restaurants_worker'
require_relative '../../app/workers/dishes_worker'
require_relative '../../app/workers/accounting_worker'
