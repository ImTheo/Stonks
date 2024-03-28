extends Resource
class_name ProductsItems

@export var products_data:Array[Dictionary] = [{"name":"Ninja","price":100,"texture":"res://Assets/storeItems/ninja.png"},
{"name":"Dark","price":200,"texture":"res://Assets/storeItems/armor.png"},
{"name":"Gladiator","price":200,"texture":"res://Assets/storeItems/Gladiator_armor_female.png"},
{"name":"Turtle","price":123,"texture":"res://Assets/storeItems/Turtle_armor.png"},
{"name":"Spider","price":50.42,"texture":"res://Assets/storeItems/Spider_armor.png"},
# {"name":"Ale","price":666,"texture":"res://Assets/storeItems/Adamantite_armor.png"}
]

var products:Array[Product]

func _init():
	for product in products_data:
		products.append(Product.new(product["name"],product["price"],product["texture"]))
