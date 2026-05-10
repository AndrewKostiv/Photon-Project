extends Control
# Card editor
signal nextScene(data:Item)

var card: Card

func setup(newCard:Card) -> void:
	card = newCard

## Returns card:Card
## [br]
## Used by Main to manage scenes
func getData():
	return card

func onItemSelected(item:Item) -> void: 
	nextScene.emit(item)
