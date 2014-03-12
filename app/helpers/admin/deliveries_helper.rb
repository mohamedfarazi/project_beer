module Admin::DeliveriesHelper
	def past_delivery_dates
		array = []
		Delivery.find_by_sql("select distinct expected_date from deliveries").each do |d|
			array << d.expected_date
		end
		array
	end
end