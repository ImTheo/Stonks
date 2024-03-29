class_name Product
extends Resource
@export var name:String
@export var price:float
@export var texture_asset:String
@export var count:int

func increment_count():
	count = count+1

func decrement_count():
	count = count-1
