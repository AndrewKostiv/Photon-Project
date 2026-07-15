extends Resource
class_name Deck

const DEFAULT_TITLE:String = "Untitled Deck"
@export var title:String = DEFAULT_TITLE
@export var cards:Array[Card] = []
@export var window: Array[Card] = []
var windowSize: int = 5
var lastCard: Card

## Returns new Deck object
func _init(newTitle:String = DEFAULT_TITLE, newCards:Array[Card] = []) -> void:
	title = newTitle
	cards = newCards

## Returns all class data as a Dictionary 
## [br][br]
## Returns {"title": title:String, "cards": cards:Array[lb]Card[rb]}
## [br][br]
## [b]Example Output:[/b]
## [codeblock]
## {"title": title, "cards": [...]}
## [/codeblock]
func getData() -> Dictionary:
	var data: Dictionary = { "title": title, "cards": [] }
	for card:Card in cards: data.cards.append(card.getData())
	return data

## Adds a new card to the deck 
## [br]
## @param newCard:Card = Card.new("Untitled Card")
## [br]
func addCard(newCard:Card = Card.new("Untitled Card")) -> void:
	cards.append(newCard)
	Data.saveData()

## Removes card:Card from cards:Array[Card] and saves
func removeCard(card:Card) -> void:
	cards.erase(card)
	Data.saveData()

func getCard(): 
	if window.size() < 1: _makeWindow()
	return window.pop_front()

func _makeWindow() -> void:
	var notKnownCards: Array[Card] = []
	var knownCards: Array[Card] = []
	for card:Card in cards:
		if card.isKnown(): knownCards.append(card)
		else: notKnownCards.append(card)
	notKnownCards.sort_custom(func(a:Card,b:Card): 
		if (a.getAverageAccuracy() == -1) && (b.getAverageAccuracy() != 0): return true
		return a.getAverageAccuracy() > b.getAverageAccuracy() )
	knownCards.sort_custom(func(a:Card,b:Card):
		if (a.getAverageTime() == -1) && (b.getAverageTime() != -1): return true
		return a.getAverageTime() > b.getAverageTime() )
	for card:Card in notKnownCards:
		if window.size() >= windowSize: return
		else: window.append(card)
	for card:Card in knownCards: 
		if window.size() >= windowSize: return
		else: window.append(card)
