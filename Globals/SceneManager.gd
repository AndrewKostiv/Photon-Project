extends Node

const DECK_CARD = preload("res://Pages/DeckMenu/Deck Card/deck_card.tscn")
const DECK_MENU = preload("res://Pages/DeckMenu/Deck Menu.tscn")
const DECK_EDITOR = preload("res://Pages/Deck Editor/deck_editor.tscn")

func changeSceneTo(newScene: PackedScene):
	if newScene: get_tree().change_scene_to_packed(newScene)
	else: printerr("Failed to change scene")
