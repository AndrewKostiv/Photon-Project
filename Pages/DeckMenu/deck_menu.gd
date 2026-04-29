extends Control
@onready var new_deck_input: LineEdit = %newDeckInput
@onready var deck_cards_container: FlowContainer = %DeckCardsContainer

func _on_line_edit_text_submitted(new_text: String) -> void:
	_addDeck(new_text)
	
func _on_add_deck_pressed() -> void:
	_addDeck(new_deck_input.text)

func _addDeck(newDeckTitle:String):
	new_deck_input.clear()
	if !newDeckTitle: return
	var newDeck:Deck = Deck.new(newDeckTitle)
	displayDeck(newDeck)
	Data.decks.append(newDeck)
	Data.saveData()

func _ready() -> void:
	Data.decksLoaded.connect(displayDecks)
	clearDisplayedDecks()
	displayDecks()

func displayDecks() -> void:
	var decks:Array[Deck] = Data.decks
	for deck:Deck in decks: displayDeck(deck)

func displayDeck(newDeck:Deck) -> void:
	var newDeckCard := SceneManager.DECK_CARD.instantiate()
	newDeckCard.setDeck(newDeck)
	deck_cards_container.add_child(newDeckCard)

func clearDisplayedDecks() -> void:
	var displayedDecks = deck_cards_container.get_children()
	for deckCard in displayedDecks:
		deckCard.queue_free()
