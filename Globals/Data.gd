extends Node
signal decksLoaded

const SAVE_FILE_PATH: String = "user://StudyToolSave.save"
var decks: Array[Deck] = []
var selectedDeck: Deck 
var activeCards: Array[Card] = []
enum Mode {
	AUTO,
	MULTIPLECHOICE,
	SPELLING,
	SPEED,
}
var selectedStudyMode: Mode

func _ready() -> void:
	loadData()

## Saves data
func saveData():
	var data:Dictionary = { "decks":[] }
	for deck:Deck in decks: data.decks.append(deck.getData())
	var decksJSON = JSON.stringify(data)
	var save_file = FileAccess.open(SAVE_FILE_PATH, FileAccess.WRITE)
	save_file.store_line(decksJSON)
	save_file.close()
	#print_debug("Save Data")

## Loads last saved data
func loadData():
	if not FileAccess.file_exists(SAVE_FILE_PATH):
		printerr("No save file found")
		return
	var save_file = FileAccess.open(SAVE_FILE_PATH, FileAccess.READ)
	while save_file.get_position() < save_file.get_length():
		# get data
		var json_string = save_file.get_line()
		var json = JSON.new()
		# validate load
		var parse_result = json.parse(json_string) 
		if not parse_result == OK: 
			printerr("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
			continue
		# extract data
		var data:Dictionary = json.data
		# parse extracted data into usable deck objects
		decks = _getDecks(data.decks)
	save_file.close()
	decksLoaded.emit()

#region loadData helper functions
func _getDecks(decksArray:Array) -> Array[Deck]: # Only for loadData
	var result:Array[Deck] = []
	for deck: Dictionary in decksArray: result.append(Deck.new(deck.title, _getCards(deck.cards)))
	return result

func _getCards(cardsArray:Array) -> Array[Card]: # Only for loadData
	var result: Array[Card] = []


	for card: Dictionary in cardsArray: 
		var accuracy: Array[float] = []
		var times: Array[float] = []
		
		accuracy.assign(card.get("accuracyArray", []))
		times.assign(card.get("timeArray", []))
		
		result.append(Card.new(
			card.title,
			card.question,
			card.answer,
			card.get("isFavored", false),
			accuracy,
			times
		))
	return result

#endregion
