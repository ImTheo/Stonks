extends Control

func _ready():
	pass

func _on_button_buy_items_pressed():
	# Path to the buy items scene
	print("why")
	get_tree().change_scene_to_file("res://Menu/buyScene.tscn")

func _on_button_view_invoices_pressed():
	print("invoice")

func _on_button_exit_pressed():
	get_tree().quit()
