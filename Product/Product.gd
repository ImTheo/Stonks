class_name Product
var name:String
var price:float
var texture_asset:String
var count:int

func _init(name:String,price:float,texture:String):
	self.name = name
	self.price = price
	self.texture_asset = texture
	self.count = 0

func increment_count():
	count = count+1

func decrement_count():
	count = count-1
