extends Control
# deck editor

@onready var title_label: LineEdit = %TitleLabel
@onready var cards_container: VBoxContainer = %CardsContainer
@onready var add_card_input: LineEdit = %AddCardInput
@onready var deck:Deck = Data.selectedDeck


func _ready() -> void:
	if !deck:
		SceneManager.changeSceneTo(SceneManager.DECK_MENU)
		printerr("No deck is selected")
	title_label.text = deck.title
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

func _on_add_card_pressed() -> void: 
	deck.addCard()
	reDrawCards()

func _on_title_label_text_changed(new_text: String) -> void:
	deck.title = new_text
	Data.saveData()

func _on_auto_pressed() -> void:
	Data.selectedDeck = deck
	Data.selectedStudyMode = Data.Mode.AUTO
	SceneManager.changeSceneTo(SceneManager.STUDY_MODE)

func _on_multiple_choice_pressed() -> void:
	Data.selectedDeck = deck
	Data.selectedStudyMode = Data.Mode.MULTIPLECHOICE
	SceneManager.changeSceneTo(SceneManager.STUDY_MODE)

func _on_spelling_pressed() -> void:
	Data.selectedDeck = deck
	Data.selectedStudyMode = Data.Mode.SPELLING
	SceneManager.changeSceneTo(SceneManager.STUDY_MODE)

func _on_speed_pressed() -> void:
	Data.selectedDeck = deck
	Data.selectedStudyMode = Data.Mode.SPEED
	SceneManager.changeSceneTo(SceneManager.STUDY_MODE)

func _on_back_pressed() -> void:
	Data.selectedDeck = null
	SceneManager.changeSceneTo(SceneManager.DECK_MENU)
