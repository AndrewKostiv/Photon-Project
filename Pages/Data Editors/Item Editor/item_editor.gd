extends Control
# Item editor

var item:Item

func setup(newItem:Item) -> void:
	item = newItem

## Returns item:Item
## [br]
## Used by Main to manage scenes
func getData():
	return item
