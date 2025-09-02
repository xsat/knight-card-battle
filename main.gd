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

var deck: Array[PlayCard] = [] 

func _ready() -> void:
	_spawn_players()
	_create_deck()
	
	for i: int in play_cards.size():
		play_cards[i].select_card.connect(_on_card_select)
		play_cards[i].set_play_card(deck[i])

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
		for play_type: PlayCard.Type in PlayCard.Type.values():
			for play_direction: PlayCard.Direction in PlayCard.Direction.values():
				var new_play_card: PlayCard = PlayCard.new()
				new_play_card.set_direction(play_direction)
				new_play_card.set_type(play_type)
				
				deck.append(new_play_card)
	
	deck.shuffle()
	
func _on_card_select(card: Card) -> void:
	_update_seleted_cards(card)
	
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
