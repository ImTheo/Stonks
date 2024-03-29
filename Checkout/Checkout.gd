extends Control

@onready var products:Array[Product] = CartList.products
var save_object = SaveResource.new()
var header:String
var detail:String
var invoice:String

func _ready():
	CartList.products = []
	poblateItemList()
	$VBoxContainer/HBoxContainer/Button_ConfirmPurchase/Title_ConfirmPurchase.text = "Purchase for: " + str(calculate_total()) + "$"

func poblateItemList():
	var itemList:ItemList = $VBoxContainer/HBoxContainer_Products/ItemList as ItemList
	for product:Product in products:
		header = product.name
		detail = "#" + str(product.count) + " x " + str(product.price) + "€"
		invoice = detail + " " + header
		itemList.add_item(invoice, load(product.texture_asset))

func _on_button_confirm_purchase_pressed():
	var invoice:Invoice = Invoice.new()
	invoice.products = products
	invoice.total = calculate_total()
	save_object.write_saveInvoice(invoice)
	get_tree().change_scene_to_file("res://main.tscn")

func calculate_total() -> float:
	var total:float = 0
	for product:Product in products:
		total += product.price * product.count
	return total

func _on_button_2_cancel_pressed():
	get_tree().change_scene_to_file("res://main.tscn")
