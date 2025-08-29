extends Control

class_name Cell

@export var top_cell: Cell
@export var bottom_cell: Cell
@export var left_cell: Cell
@export var right_cell: Cell

func _on_button_pressed() -> void:
	print("_on_button_pressed")
