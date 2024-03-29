extends Control

@onready var products:Array[Product] = CartList.products

func _ready():
	CartList.products = []
	var itemList:ItemList = $VBoxContainer/HBoxContainer_Products/ItemList as ItemList
	var header:String
	var detail:String
	var invoice:String
	for product:Product in products:
		header = product.name
		detail = "#" + str(product.count) + " x " + str(product.price) + "€"
		invoice = detail + " " + header
		itemList.add_item(invoice, load(product.texture_asset))
	$VBoxContainer/HBoxContainer/Button_ConfirmPurchase/Title_ConfirmPurchase.text = "Purchase for: " + calculate_total() + "$"

func _on_button_confirm_purchase_pressed():
	pass
	# append total to $VBoxContainer/HBoxContainer/Button2_Cancel/Title_Cancel

func calculate_total() -> String:
	var total:float = 0
	for product:Product in products:
		total += product.price * product.count
	return str(total)

func _on_button_2_cancel_pressed():
	get_tree().change_scene_to_file("res://main.tscn")
