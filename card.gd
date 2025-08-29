extends Control

class_name Card

signal select_card(card: Card)

enum Type {ATTACK, MOVE}
enum Direction {FORWARD, BACKWARD, LEFT, RIGHT}

@export var type: Type
@export var direction: Direction

@onready var play_type: Label = $PlayType
@onready var play_direction: Label = $PlayDirection
@onready var play_number: Label = $PlayNumber

func set_play_number(number: int) -> void:
	play_number.text = str(number)
	
func update_play_type_direction() -> void:
	_update_play_type()
	_update_play_direction()

func _ready() -> void:
	_update_play_type()
	_update_play_direction()

func _update_play_type() -> void:
	if type == Type.ATTACK:
		play_type.text = "ATTACK"
	elif type == Type.MOVE:
		play_type.text = "MOVE"

func _update_play_direction() -> void:
	if direction == Direction.FORWARD:
		play_direction.text = "FORWARD"
	elif direction == Direction.BACKWARD:
		play_direction.text = "BACKWARD"
	elif direction == Direction.LEFT:
		play_direction.text = "LEFT"
	elif direction == Direction.RIGHT:
		play_direction.text = "RIGHT"

func _on_button_pressed() -> void:
	select_card.emit(self)
	
	play_number.set_visible(not play_number.is_visible())

func _on_button_mouse_entered() -> void:
	scale *= 2
	z_index += 1

func _on_button_mouse_exited() -> void:
	scale /= 2
	z_index -= 1
