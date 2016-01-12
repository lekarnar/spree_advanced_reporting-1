module Spree
  class GeoRevenueReport
    attr_accessor :orders, :states, :countries

    def initialize(params)
      if params[:q]
        orders = Order.eager_load(:bill_address).ransack(params[:q]).result
      else
        orders = Order.eager_load(bill_address: [:state, :country])
          .where(completed_at: Time.current..Time.current - 1.month)
      end
      states = {}
      countries = {}
    end

    def calculate_totals
      orders.each do |order|
        
      end
    end

    def revenue(order)
      rev = order.item_total
    end
  end
end
