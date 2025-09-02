extends Control

class_name Cell

@export_group("Siblings")
@export var top_cell: Cell
@export var bottom_cell: Cell
@export var left_cell: Cell
@export var right_cell: Cell

@onready var items: HBoxContainer = $Items
