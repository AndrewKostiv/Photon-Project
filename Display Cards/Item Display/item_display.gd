extends Control
# item display

signal nextScene(card:Card)
signal deleteItem(item:Item)

@onready var check_box: CheckBox = $CheckBox
@onready var title: Button = $Title

var item: Item

func _init(newItem:Item) -> void:
	item = newItem
	title.text = item.question

func _on_delete_pressed() -> void: 
	deleteItem.emit(item)
	queue_free()

func _on_title_pressed() -> void: nextScene.emit(item)
