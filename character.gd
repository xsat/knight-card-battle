extends Control

class_name Character

@onready var title: Label = $Title

func set_title_text(text: String) -> void:
	title.set_text(text)
