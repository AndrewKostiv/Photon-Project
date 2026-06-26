extends Control
# deck editor

signal nextScene(data:Card)
@onready var title_label: LineEdit = %TitleLabel
@onready var cards_container: VBoxContainer = %CardsContainer
@onready var add_card_input: LineEdit = %AddCardInput
@onready var deck:Deck

func setup(newDeck:Deck) -> void:
	deck = newDeck
	title_label.text = newDeck.title
	reDrawCards() 

func removeCard(card:Card):
	deck.removeCard(card)

#func toggleFavorCard(favorCard:Card): pass #TODO: Implement favored items

func reDrawCards() -> void:
	var displayedCards = cards_container.get_children()
	for card:Control in displayedCards: card.queue_free()
	for card:Card in deck.cards: _addCardDisplay(card)

func _addCardDisplay(newCard:Card):
	var cardDisplay = SceneManager.getCardDisplay()
	cards_container.add_child(cardDisplay)
	cardDisplay.setData(newCard)
	cardDisplay.deleteCard.connect(removeCard)
	#cardDisplay.favorCard.connect(toggleFavorCard) TODO: reinstate this when implemented
	cardDisplay.nextScene.connect(onCardSelected)

func onCardSelected(data:Card) -> void:
	nextScene.emit(data)

## Returns deck:Deck
## [br]
## Used by Main to manage scenes
func getData(): return deck

func _on_add_card_pressed() -> void: 
	deck.addCard()
	reDrawCards()

func _on_title_label_text_changed(new_text: String) -> void:
	deck.title = new_text
	Data.saveData()
