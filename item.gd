extends Control

class_name Item

@onready var item_name: Label = $ItemName

func set_item_name_text(text: String) -> void:
	item_name.set_text(text)

	
