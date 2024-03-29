class_name Cart
extends Control

@onready var products_container = [%Product_1,%Product_2]
var current_page:int = 1
var next_page:int = current_page + 1
var products = preload("res://productos.tres").products

func _ready():
	show_next_pages_buttons()
	show_products(current_page)

func show_next_pages_buttons():
	var prior_button:Button = $VBoxContainer2/HBoxContainer/Button_PriorPage
	var next_button:Button = $VBoxContainer2/HBoxContainer/Button_NextPage
	prior_button.disabled = current_page == 1
	next_button.disabled = (current_page+1)*2 > products.size()+1

func add_purchased_product(product:Product):
	if CartList.products.find(product) == -1:
		CartList.products.append(product)

func show_products(page:int):
	products_container[0].load_product(products[page*2-2],self)
	if (page*2-1) < products.size(): 
		products_container[1].load_product(products[page*2-1],self)
		products_container[1].show()
	else: 
		products_container[1].hide()

func _on_button_2_back_pressed():
	get_tree().change_scene_to_file("res://main.tscn")
	
func _on_button_purchase_items_pressed():
	get_tree().change_scene_to_file("res://Checkout/Checkout.tscn")

func _on_button_next_page_pressed():
	current_page += 1
	show_next_pages_buttons()
	show_products(current_page)

func _on_button_prior_page_pressed():
	current_page -= 1
	show_next_pages_buttons()
	show_products(current_page)
