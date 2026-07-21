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

func getCard():
	if window.is_empty(): _makeWindow()
	return window.pop_front()

func _makeWindow() -> void: 
	window.clear()
	window.append_array(getWindow())

func getWindow() -> Array[Card]:
	var newWindow: Array[Card] = []
	var unknownCards: Array[Card] = cards.filter(func(a:Card): return !a.isKnown())
	var knownCards: Array[Card] = cards.filter(func(a:Card): return a.isKnown())
	#print_debug("unknownCards.size() = ", unknownCards.size(), " knownCards.size() = ", knownCards.size())
	
	# fill window with unknown cards
	while newWindow.size() < windowSize and !unknownCards.is_empty():
		newWindow.append(unknownCards.pop_front())

	# if there are no known cards, theres nothing more to do
	if knownCards.is_empty(): 
		return newWindow
	
	# add a known card if possible
	if newWindow.size() == windowSize and !knownCards.is_empty():
		var i := randi_range(0, newWindow.size() - 1)
		newWindow.remove_at(i)
		newWindow.append(knownCards.pick_random())
		return newWindow

	# Add known cards, the ones with the highest average time go first
	knownCards.sort_custom(func(a:Card,b:Card): return a.getAverageTime() > b.getAverageTime())
	while newWindow.size() < windowSize and !knownCards.is_empty():
		newWindow.append(knownCards.pop_front())
	
	# Debug info
	if newWindow.is_empty(): 
		printerr("There are no cards")
	elif  newWindow.size() < windowSize:
		print_debug("There are not enough cards")
	return newWindow

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

func getAnswerList(questionCard:Card, listSize:int = 4) -> Array[Card]:
	var answerList:Array[Card] = []
	var tempWindow: Array[Card] = getWindow()
	
	# ensure the correct answer is always there
	answerList.append(questionCard)
	
	# add cards that are not the answer
	tempWindow.erase(questionCard)
	for card: Card in tempWindow: 
		if answerList.size() == listSize: break
		answerList.append(card)
	
	# add duplicates of existing cards until answerList is big enough
	if answerList.size() < listSize:
		tempWindow.append(questionCard)
		tempWindow.shuffle()
		for card:Card in tempWindow:
			if answerList.size() == listSize: break
			answerList.append(card)

	# return shuffled answerList
	answerList.shuffle()
	return answerList

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
