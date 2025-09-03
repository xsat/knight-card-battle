extends Control

class_name Character

@onready var direction: Label = $Direction
@onready var title: Label = $Title

var location: Cell
var play_card: PlayCard

func set_title_text(text: String) -> void:
	title.set_text(text)
	
func set_location(new_location: Cell) -> void:
	location = new_location

func set_play_card(new_play_card: PlayCard, is_on_swan: bool = false) -> void:
	play_card = new_play_card
	direction.text = play_card.get_direction_text()
