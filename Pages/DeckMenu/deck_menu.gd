extends Control

signal nextScene(data:Deck)
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
	var newDeckDisplay := SceneManager.DECK_DISPLAY.instantiate()
	if !newDeckDisplay: 
		printerr("Failed to instantiate DECK_DISPLAY")
		return
	newDeckDisplay.setDeck(newDeck)
	deck_cards_container.add_child(newDeckDisplay)
	newDeckDisplay.nextScene.connect(onDeckSelected)

func clearDisplayedDecks() -> void:
	var displayedDecks = deck_cards_container.get_children()
	for deckCard in displayedDecks:
		deckCard.queue_free()

func onDeckSelected(data:Deck):
	nextScene.emit(data)
