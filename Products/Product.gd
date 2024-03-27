extends MarginContainer

@export var count = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_button_add_pressed():
	count = count + 1
	print(count)
	$VBoxContainer/VBoxContainer/Label_ProductCount.text = str(count)
	
func _on_button_minus_pressed():
	if count > 0:
		count = count - 1
		print(count)
		$VBoxContainer/VBoxContainer/Label_ProductCount.text = str(count)
