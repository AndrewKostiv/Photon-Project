extends Control
signal deleteItem(item:Item)
@onready var check_box: CheckBox = $CheckBox
@onready var quesiton_input: LineEdit = $quesitonInput
@onready var answer_input: LineEdit = $answerInput
var item: Item

func _init(newItem:Item) -> void:
	item = newItem
	quesiton_input.text = newItem.question
	answer_input.text = newItem.answer

func _on_quesiton_input_text_changed(new_text: String) -> void: item.question = new_text

func _on_answer_input_text_changed(new_text: String) -> void: item.answer = new_text

func _on_delete_pressed() -> void: 
	deleteItem.emit(item)
	queue_free()
