extends Control

@onready var scene_container: Control = $"Scene Container"
@export var scene_stack: Array = []

func _ready() -> void: 
	open_deck_menu()

func removeCurrentScene() -> void:
	print_debug("Remove current scene")
	var currentScene = scene_container.get_children()
	for item in currentScene: item.queue_free()

func _on_back_pressed() -> void:
	if scene_stack.is_empty(): return
	removeCurrentScene()
	var nextSceneData = scene_stack.pop_back()
	if typeof(nextSceneData) == typeof("Deck Menu"): open_deck_menu()
	elif nextSceneData is Deck: open_deck_editor(nextSceneData)
	elif nextSceneData is Card: open_card_editor(nextSceneData)
	elif nextSceneData is Item: open_item_editor(nextSceneData)
	else: printerr("No scene type found")

func open_deck_menu() -> void:
	#print_debug("Open deck menu")
	removeCurrentScene()
	var deckMenu = SceneManager.getDeckMenu()
	scene_container.add_child(deckMenu)
	deckMenu.nextScene.connect(open_deck_editor)

func open_deck_editor(deck:Deck) -> void: 
	#print_debug("Open deck editor")
	scene_stack.append("Deck Menu")
	removeCurrentScene()
	var deckEditor = SceneManager.getDeckEditor()
	scene_container.add_child(deckEditor)
	deckEditor.nextScene.connect(open_card_editor)
	deckEditor.setup(deck)

func open_card_editor(card:Card) -> void: 
	#print_debug("Open card editor")
	scene_stack.append(scene_container.get_child(0).getData())
	removeCurrentScene()
	var cardEditor = SceneManager.getCardEditor()
	scene_container.add_child(cardEditor)
	cardEditor.nextScene.connect(open_item_editor)
	cardEditor.setup(card)

func open_item_editor(item:Item) -> void: 
	#print_debug("Open item editor")
	scene_stack.append(scene_container.get_child(0).getData())
	removeCurrentScene()
	var itemEditor = SceneManager.getItemEditor()
	scene_container.add_child(itemEditor)
	itemEditor.setup(item)
 
