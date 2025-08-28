extends Control


@onready var card_9: Card = $Game/Hand/Card9
@onready var card_6: Card = $Game/Hand/Card6
@onready var card_8: Card = $Game/Hand/Card8
@onready var card_7: Card = $Game/Hand/Card7
@onready var card_5: Card = $Game/Hand/Card5
@onready var card_4: Card = $Game/Hand/Card4
@onready var card_3: Card = $Game/Hand/Card3
@onready var card_2: Card = $Game/Hand/Card2
@onready var card_1: Card = $Game/Hand/Card1
@onready var card_0: Card = $Game/Hand/Card0

@onready var selected_cards: Array[Card] = []


func _ready() -> void:
	card_9.select_card.connect(_on_card_select)
	card_8.select_card.connect(_on_card_select)
	card_7.select_card.connect(_on_card_select)
	card_6.select_card.connect(_on_card_select)
	card_5.select_card.connect(_on_card_select)
	card_4.select_card.connect(_on_card_select)
	card_3.select_card.connect(_on_card_select)
	card_2.select_card.connect(_on_card_select)
	card_1.select_card.connect(_on_card_select)
	card_0.select_card.connect(_on_card_select)
	
	
func _on_card_select(card: Card) -> void:
	_update_seleted_cards(card)
	
	
func _update_seleted_cards(card: Card) -> void:
	if selected_cards.has(card):
		selected_cards.erase(card)
		card.clear_play_number()
		
		var card_number = 1
		for select_card: Card in selected_cards:
			select_card.set_play_number(card_number)
			card_number += 1
	else:
		selected_cards.append(card)
		card.set_play_number(selected_cards.size())
