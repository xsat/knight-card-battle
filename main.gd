extends Control

@export_group("Cards")
@export var cards_for_each_type: int = 20
@export_range(1, 10) var cards_select_per_round: int = 5

@onready var spawn: Array[Cell] = [
	$Game/Grid/Cell00,
	$Game/Grid/Cell04,
	$Game/Grid/Cell40,
	$Game/Grid/Cell44,
]

@onready var hand: Array[Card] = [
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

var deck: Array[PlayCard] = [] 
var selected_cards: Array[Card] = []

var player: Character
var enemies: Array[Character] = []

func _ready() -> void:
	_create_deck()
	_spawn_players()
	
	for i: int in hand.size():
		hand[i].select_card.connect(_on_card_select)
		hand[i].set_play_card(deck[i])

func _spawn_players() -> void:
	spawn.shuffle()
	
	if spawn.size() >= 1:
		player = preload("res://character.tscn").instantiate()
		spawn[0].characters.add_child(player)
		player.set_title_text("Player 1")
		player.set_play_card(deck.pick_random(), true)
		player.set_location(spawn[0])
	
	if spawn.size() >= 2:
		var player2_character: Character = preload("res://character.tscn").instantiate()
		spawn[1].characters.add_child(player2_character)
		player2_character.set_title_text("Player 2")
		player2_character.set_play_card(deck.pick_random(), true)
		player2_character.set_location(spawn[1])
		enemies.append(player2_character)

func _create_deck() -> void:
	deck = []
	
	for i: int in range(cards_for_each_type):
		for play_type: PlayCard.Type in PlayCard.Type.values():
			for play_direction: PlayCard.Direction in PlayCard.Direction.values():
				deck.append(PlayCard.build_from_direction_type(play_direction, play_type))
	
	deck.shuffle()
	
func _on_card_select(card: Card) -> void:
	_update_seleted_cards(card)
	
	for selected_card: Card in selected_cards:
		player.set_play_card(selected_card.get_play_card())
	
func _update_seleted_cards(card: Card) -> void:
	if selected_cards.has(card):
		card.hide_number()
		selected_cards.erase(card)
		
		var card_number: int = 1
		for select_card: Card in selected_cards:
			select_card.set_number(card_number)
			card_number += 1
	else:
		if selected_cards.size() < cards_select_per_round:
			selected_cards.append(card)
			card.set_number(selected_cards.size())
			card.show_number()
