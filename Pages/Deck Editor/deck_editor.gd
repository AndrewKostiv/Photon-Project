extends Control

@onready var title_label: LineEdit = %TitleLabel
@onready var cards_container: VBoxContainer = %CardsContainer
@onready var deck:Deck = Data.activeDeck
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	title_label.text = deck.title
	displayCards()

func addCardDisplay(newCard:Card):
	var cardDisplay := SceneManager.CARD_DISPLAY.instantiate()
	cards_container.add_child(cardDisplay)
	cardDisplay.setData(newCard)
	cardDisplay.deleteCard.connect(removeCard)
	#cardDisplay.favorCard.connect(toggleFavorCard) TODO: reinstate this when implemented

func removeCard(card:Card):
	deck.removeCard(card)

#func toggleFavorCard(favorCard:Card): pass #TODO: Implement favored items

func _on_add_card_pressed() -> void: 
	deck.addCard()

func removeDisplayedCards() -> void:
	var displayedCards := cards_container.get_children()
	for card in displayedCards: queue_free()

func displayCards() -> void:
	for card:Card in deck.cards:
		addCardDisplay(card)
