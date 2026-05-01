extends Node

const DECK_CARD = preload("res://Pages/DeckMenu/Deck Card/deck_card.tscn")
const DECK_MENU = preload("res://Pages/DeckMenu/Deck Menu.tscn")
const DECK_EDITOR = preload("res://Pages/Deck Editor/deck_editor.tscn")
const CARD_DISPLAY = preload("res://Pages/Deck Editor/Card Display/card_display.tscn")
const ITEM_DISPLAY = preload("res://Pages/Deck Editor/Card Display/Item Display/item_display.tscn")

func changeSceneTo(newScene: PackedScene):
	if newScene: get_tree().change_scene_to_packed(newScene)
	else: printerr("Failed to change scene")
