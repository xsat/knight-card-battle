extends Control

class_name Card

signal select_card(card: Card)

@onready var direction: Label = $Direction
@onready var type: Label = $Type
@onready var number: Label = $Number

@onready var background: ColorRect = $Background

var play_card: PlayCard

func set_number(_number: int) -> void:
	number.text = str(_number)

func show_number() -> void:
	number.set_visible(true)
	background.set_color(Color.YELLOW)
	
func hide_number() -> void:
	number.set_visible(false)
	background.set_color(Color.BLACK)
	
func set_play_card(new_play_card: PlayCard) -> void:
	play_card = new_play_card
	
	direction.text = play_card.get_direction_text()
	type.text = play_card.get_type_text()
	
func _on_button_pressed() -> void:
	select_card.emit(self)

func _on_button_mouse_entered() -> void:
	scale *= 2
	z_index += 1

func _on_button_mouse_exited() -> void:
	scale /= 2
	z_index -= 1
