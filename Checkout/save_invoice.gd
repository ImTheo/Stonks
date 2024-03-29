class_name SaveResource
extends Resource

@export var invoice:Invoice
const SAVE_INVOICE_PATH := "res://Saves/invoice"

func write_saveInvoice(products:Invoice)->void:
	var timestamp = Time.get_time_string_from_system()
	timestamp = timestamp.replace(":","_")
	invoice = products
	ResourceSaver.save(self,SAVE_INVOICE_PATH+str(timestamp)+".tres")
