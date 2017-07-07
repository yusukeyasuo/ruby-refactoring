require 'ostruct'
class OrdersReport
  def initialize(orders, start_date, end_date)
    @orders = orders
    @start_date = start_date
    @end_date = end_date
  end

  def total_sales_within_date_range
    orders_within_range = @orders.select do |order|
      order.placed_at >= @start_date && order.placed_at <= @end_date
    end

    orders_within_range.map(&:amount).inject(0) do |sum, amount|
      sum + amount
    end
  end
end

class Order < OpenStruct
end
