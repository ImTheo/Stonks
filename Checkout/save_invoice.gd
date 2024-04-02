class_name SaveResource
extends Resource

@export var invoice:Invoice
const SAVE_INVOICE_PATH := "res://Saves/invoice"
func write_saveInvoice(products:Invoice)->void:
	var timestamp = Time.get_time_string_from_system()
	timestamp = timestamp.replace(":","_")
	invoice = products
	ResourceSaver.save(self,SAVE_INVOICE_PATH+str(timestamp)+".tres")

func load_invoices()->Dictionary:
	var saves = DirAccess.open("res://Saves")
	#example of the dictionary 
	#{
	#	"2021-09-07 14_00_00.tres":Invoice,
	#	"2021-09-07 14_00_01.tres":Invoice,
	#	"2021-09-07 14_00_02.tres":Invoice,}
	var save_files = saves.list_dir_begin()
	var save_file = saves.get_next()
	var save_dict:Dictionary = {}
	while save_file != "":
		var save:Resource = load("res://Saves/"+save_file)
		print("res://Saves/"+save_file)
		save_dict[save_file] = save
		save_file = saves.get_next()
	saves.list_dir_end()
	return save_dict

#func load_invoice(index:int)->Invoice:
	#var saves = DirAccess.new()
	#var save_files = saves.list_dir_begin(SAVE_INVOICE_PATH,0)
	#var save_file = saves.get_next()
	#var i = 0
	#while save_file != "":
		#if i == index:
			#var save = ResourceLoader.load(SAVE_INVOICE_PATH+save_file)
			#return save
		#i += 1
		#save_file = saves.get_next()
	#saves.list_dir_end()
	#return null
