extends Resource
class_name Deck

const DEFAULT_TITLE:String = "Untitled Deck"
@export var title:String = DEFAULT_TITLE
@export var cards:Array[Card] = []

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
