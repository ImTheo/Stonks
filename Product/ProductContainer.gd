class_name ProductContainer
extends VBoxContainer

@export var count:int = 0
var title_product:String
var price_product:float
var product:Product

func load_product(product:Product):
	$VBoxContainer/Label_ProductCount.text = str(product.count)
	set_texture(product.texture_asset)
	set_title(product.name)
	set_price(product.price)
	self.product = product

func set_title(title:String):
	$Label_ProductTitle.text = title

func set_price(price:float):
	$Label_ProductPrice.text = str(price) + "$"

func set_texture(asset:String):
	$TextureRect.texture = load(asset)

func _on_button_add_pressed():
	product.increment_count()
	$VBoxContainer/Label_ProductCount.text = str(product.count)
	
func _on_button_minus_pressed():
	if product.count > 0:
		product.decrement_count()
		$VBoxContainer/Label_ProductCount.text = str(product.count)

func _on_button_buy_product_pressed():
	print("comprar "+str(product))
