class Spree::AdvancedReport::IncrementReport::Count < Spree::AdvancedReport::IncrementReport
  def name
    "Count"
  end

  def column
    "Count"
  end

  def description
    "Skupno število zaključenih naročil"
  end

  def initialize(params)
    super(params)
    self.total = 0
    self.orders.each do |order|
      unless order.void?
        date = {}
        INCREMENTS.each do |type|
          date[type] = get_bucket(type, order.completed_at)
          data[type][date[type]] ||= {
            :value => 0,
            :display => get_display(type, order.completed_at),
          }
        end
        order_count = order_count(order)
        INCREMENTS.each { |type| data[type][date[type]][:value] += order_count }
        self.total += order_count
      end
    end

    generate_ruport_data
  end
end
