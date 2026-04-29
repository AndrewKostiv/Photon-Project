extends Node
class_name Item

var question: String
var answer: String

func _init(newQuestion:String, newAnswer:String) -> void:
	question = newQuestion
	answer = newAnswer
	
func getData() -> Dictionary:
	return { "question": question, "answer": answer }
