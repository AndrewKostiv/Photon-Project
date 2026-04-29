extends Control

@onready var title_label: Label = %TitleLabel
@onready var cards_container: VBoxContainer = %CardsContainer
@onready var deck:Deck = Data.activeDeck
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	title_label.text = deck.title
	
