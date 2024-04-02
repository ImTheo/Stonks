extends Control

@onready var inovices:Array[Invoice]
var invoices_folder:String = "res://Saves"
var save_object = SaveResource.new()
var header:String

func _ready():
	poblateItemList()

func poblateItemList():
	var itemList:ItemList = %ItemList as ItemList
	#load the invoices from invoices_folder 
	var inovices_dict = save_object.load_invoices()
	for invoice in inovices_dict:
		header = "Invoice: " + str(invoice)
		itemList.add_item(header)

func _on_button_back_title_pressed():
	get_tree().change_scene_to_file("res://main.tscn")
