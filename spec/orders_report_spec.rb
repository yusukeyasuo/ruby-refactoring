require_relative '../orders_report'
require 'spec_helper'

describe OrdersReport do
  describe '#total_sales_within_date_range' do
    it 'returns total sales in range' do
      order_within_range1 = Order.new(amount: 5,
                                      placed_at: Date.new(2016, 10, 10))
      order_within_range2 = Order.new(amount: 10,
                                      placed_at: Date.new(2016, 10, 15))
      order_out_of_range = Order.new(amount: 6,
                                     placed_at: Date.new(2016, 1, 1))
      orders = [order_within_range1, order_within_range2, order_out_of_range]

      date_range = DateRange.new(Date.new(2016, 10, 1), Date.new(2016, 10, 31))
      expect(OrdersReport.
             new(orders, date_range).
             total_sales_within_date_range).to eq(15)
    end
  end
end
