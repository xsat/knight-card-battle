extends Control

@export_group("Cards")
@export var cards_for_each_type: int = 20
@export_range(1, 10) var cards_select_per_round: int = 5

@export_group("Spawn")
@export var spawn: Array[Cell] = []

@onready var play_cards: Array[Card] = [
	$Game/Hand/Card9,
	$Game/Hand/Card8,
	$Game/Hand/Card7,
	$Game/Hand/Card6,
	$Game/Hand/Card5,
	$Game/Hand/Card4,
	$Game/Hand/Card3,
	$Game/Hand/Card2,
	$Game/Hand/Card1,
	$Game/Hand/Card0,
]

@onready var selected_cards: Array[Card] = []

var deck: Array[Dictionary] = [] 

func _ready() -> void:
	_spawn_players()
	
	_create_deck()
	
	for i: int in play_cards.size():
		play_cards[i].select_card.connect(_on_card_select)
		play_cards[i].type = deck[i]["type"]
		play_cards[i].direction = deck[i]["direction"]
		play_cards[i].update_play_type_direction()

func _spawn_players() -> void:
	spawn.shuffle()
	
	var player1: Item = preload("res://item.tscn").instantiate()
	spawn[0].items.add_child(player1)
	player1.set_item_name_text("Player 1")
	
	var player2: Item = preload("res://item.tscn").instantiate()
	spawn[1].items.add_child(player2)
	player2.set_item_name_text("Player 2")

func _create_deck() -> void:
	deck = []
	
	for i: int in range(cards_for_each_type):
		for type: Card.Type in Card.Type.values():
			for direction: Card.Direction in Card.Direction.values():
				deck.append({"type": type, "direction": direction})
	
	deck.shuffle()
	
func _on_card_select(card: Card) -> void:
	_update_seleted_cards(card)
	
func _update_seleted_cards(card: Card) -> void:
	if selected_cards.has(card):
		card.hide_play_number()
		selected_cards.erase(card)
		
		var card_number = 1
		for select_card: Card in selected_cards:
			select_card.set_play_number(card_number)
			card_number += 1
	else:
		print(selected_cards.size(), cards_select_per_round, selected_cards.size() <= cards_select_per_round)
		
		if selected_cards.size() < cards_select_per_round:
			selected_cards.append(card)
			card.set_play_number(selected_cards.size())
			card.show_play_number()
