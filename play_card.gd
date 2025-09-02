extends Object

class_name PlayCard

enum Direction {FORWARD, BACKWARD, LEFT, RIGHT}
enum Type {ATTACK, MOVE}

var direction: Direction
var type: Type

static func build_from_direction_type(new_direction: Direction, new_type: Type) -> PlayCard:
	var new_play_card: PlayCard = PlayCard.new()
	new_play_card.set_direction(new_direction)
	new_play_card.set_type(new_type)
	
	return new_play_card

func get_direction() -> Direction:
	return direction
	
func set_direction(new_direction: Direction) -> void:
	direction = new_direction
	
func get_type() -> Type:
	return type	

func set_type(new_type: Type) -> void:
	type = new_type

func get_direction_text() -> String:
	if direction == Direction.FORWARD:
		return "FORWARD"
	elif direction == Direction.BACKWARD:
		return "BACKWARD"
	elif direction == Direction.LEFT:
		return "LEFT"
	elif direction == Direction.RIGHT:
		return "RIGHT"
		
	return ""

func get_type_text() -> String:
	if type == Type.ATTACK:
		return "ATTACK"
	elif type == Type.MOVE:
		return "MOVE"
		
	return ""
