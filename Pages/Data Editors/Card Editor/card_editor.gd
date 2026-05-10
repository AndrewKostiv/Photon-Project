extends Control
# Card editor
signal nextScene(data:Item)

@onready var title_edit: LineEdit = $"Title Edit"
@onready var add_item: Button = $"Add Item"
@onready var items_container: VBoxContainer = %"Items Container"

var card: Card

func setup(newCard:Card) -> void:
	card = newCard
	title_edit.text = newCard.title

## Returns card:Card
## [br]
## Used by Main to manage scenes
func getData():
	return card

func onItemSelected(item:Item) -> void: 
	nextScene.emit(item)

func _on_add_item_pressed() -> void:
	card.addItem()

func redrawItemDisplay():
	for item in card.items:
		var newItemDisplay = SceneManager.getItemDisplay()
		items_container.add_child(newItemDisplay)
		newItemDisplay.setData(item)
		
