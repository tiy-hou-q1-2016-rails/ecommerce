bike =  Product.create! name: 'bike', price: 500, inventory: 5
helmet =  Product.create! name: 'helmet', price: 50, inventory: 5
advil =  Product.create! name: 'advil', price: 5, inventory: 50


jwo = User.create! email: "jwo@example.com", password: "12345678", username: "jwo"
hwo = User.create! email: "hwo@example.com", password: "12345678", username: "hwo"

order = Order.new
order.user = jwo
order.status = 'closed'
order.purchased_at = 5.days.ago
order.save!

bike_line_item = OrderItem.new
bike_line_item.order = order
bike_line_item.product = bike
bike_line_item.price = bike.price
bike_line_item.shipping_cost = 0
bike_line_item.quantity = 1
bike_line_item.save!

helmet_line_item = OrderItem.new
helmet_line_item.order = order
helmet_line_item.product = helmet
helmet_line_item.price = helmet.price
helmet_line_item.shipping_cost = 0
helmet_line_item.quantity = 1
helmet_line_item.save!


advil_order = Order.new
advil_order.user = jwo
advil_order.status = 'closed'
advil_order.purchased_at = 2.days.ago
advil_order.save!

advil_line_item = OrderItem.new
advil_line_item.order = advil_order
advil_line_item.product = advil
advil_line_item.price = advil.price
advil_line_item.shipping_cost = 0
advil_line_item.quantity = 6
advil_line_item.save!
