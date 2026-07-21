extends Control


func _ready() -> void:
	nextQuestion()

func nextQuestion():
	match Data.selectedStudyMode:
			Data.Mode.AUTO: setupAuto()
			Data.Mode.MULTIPLECHOICE: setupMultipleChoice()
			Data.Mode.SPELLING: setupSpelling()
			Data.Mode.SPEED: setupSpeed()
			_: 
				printerr("No study mode selected")
				SceneManager.changeSceneTo(SceneManager.DECK_EDITOR)

#region Setups

func setupAuto() -> void:
	clearMode()
	var auto = SceneManager.AUTO.instantiate()
	add_child(auto)
	#TODO: Connect signals

func setupMultipleChoice() -> void:
	clearMode()
	# Mannage questions
	Data.activeCards.clear()
	Data.activeCards.append(Data.selectedDeck.getCard())
	# Add MC mode
	var MC = SceneManager.MULTIPLE_CHOICE.instantiate()
	add_child(MC)
	MC.newAnswer.connect(onAnswer)
	#MC.setData(nextQuestionCard, Data.selectedDeck.getAnswerList(nextQuestionCard))

func setupSpelling() -> void:
	clearMode()
	# Mannage questions
	Data.activeCards.clear()
	Data.activeCards.append(Data.selectedDeck.getCard())
	# Add spelling mode
	var spelling = SceneManager.SPELLING.instantiate()
	add_child(spelling)
	spelling.newAnswer.connect(onAnswer)

func setupSpeed() -> void:
	clearMode()
	var speed = SceneManager.SPEED.instantiate()
	add_child(speed)
	#TODO: Connect signals

#endregion

func onAnswer(userAnswer:String, newTime:float):
	match Data.selectedStudyMode:
		Data.Mode.AUTO : pass
		Data.Mode.MULTIPLECHOICE, Data.Mode.SPELLING: 
			if userAnswer == Data.activeCards[0].answer: 
				Data.activeCards[0].onAnswer(100, newTime)
				print_debug(newTime)
				nextQuestion()
			else: 
				Data.activeCards[0].onAnswer(0)
		Data.Mode.SPEED : pass
		_: 
			printerr("No mode selected")
			SceneManager.changeSceneTo(SceneManager.DECK_EDITOR)
	Data.saveData()
	
func _on_back_pressed() -> void:
	SceneManager.changeSceneTo(SceneManager.DECK_EDITOR)

func clearMode() -> void: 
	for child in get_children():
		child.queue_free()
