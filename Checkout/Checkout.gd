extends Control

@onready var products:Array[Product] = CartList.products

func _ready():
	var itemList:ItemList = $VBoxContainer/HBoxContainer_Products/ItemList as ItemList
	#poblate the ItemList
	for product in products:
		itemList.add_item(product.name, load(product.texture_asset))


func _on_button_confirm_purchase_pressed():
	print("confirmed")

func _on_button_2_cancel_pressed():
	get_tree().change_scene_to_file("res://main.tscn")
