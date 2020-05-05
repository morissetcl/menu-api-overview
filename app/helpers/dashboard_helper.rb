module DashboardHelper
  def street_formatter(street)
    return '-' if street.nil?

    street.capitalize.truncate_words(5)
  end

  def description_formatter(description)
    return '-' if description.nil?

    description.capitalize.truncate_words(10)
  end

  def price_formatter(price)
    return '-' if price.nil?

    number_to_currency(price, precision: 0)
  end
end
