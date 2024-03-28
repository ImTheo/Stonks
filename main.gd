extends Control

func _on_button_buy_items_pressed():
	get_tree().change_scene_to_file("res://Cart/PurchaseScene.tscn")

func _on_button_view_invoices_pressed():
	print("invoice")

func _on_button_exit_pressed():
	get_tree().quit()
