# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
warehouse = Warehouse.create(name:"Rachel's Clothing Shop", location:"12345 This Way", capacity: 100)
Item.create(name:"Umbrella",weight_lb:1,count:5,warehouse_id:warehouse.id)
Item.create(name:"Raincoat",weight_lb:0.5,count:6,warehouse_id:warehouse.id)
Item.create(name:"Boots",weight_lb:1,count:4,warehouse_id:warehouse.id)
Item.create(name:"Flannel",weight_lb:0.25,count:10,warehouse_id:warehouse.id)
Item.create(name:"Swimming Trunks",weight_lb:0.5,count:11,warehouse_id:warehouse.id)
Item.create(name:"Waterproof iPhone Case",weight_lb:0.25,count:2,warehouse_id:warehouse.id)
Item.create(name:"Dad Hat",weight_lb:0.1,count:5,warehouse_id:warehouse.id)


warehouse_2 = Warehouse.create(name:"Amazon Distribution Center", location:"555 Jungle Place", capacity: 10000)
Item.create(name:"Running Shoes",weight_lb:1,count:50,warehouse_id:warehouse_2.id)
Item.create(name:"1 Terrabyte SSD",weight_lb:0.5,count:100,warehouse_id:warehouse_2.id)
Item.create(name:"Alarm Clock",weight_lb:1,count:40,warehouse_id:warehouse_2.id)
Item.create(name:"Diapers",weight_lb:0.25,count:1000,warehouse_id:warehouse_2.id)
Item.create(name:"iPhone Headphone Dongle",weight_lb:0.05,count:500,warehouse_id:warehouse_2.id)
