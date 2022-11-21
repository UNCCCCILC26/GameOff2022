extends Node

var playerBalance = 0

var inventory = {
	"lemon":0,
	"coconut":0,
	"strawberry":0,
	"cherry":0,
	"raspberry":0,
	"blackbery":0,
	"blueberry":0,
	"watermelon":0
}

var progress = {
	"introCutscene": false,
	"resturantTutorial": false,
	"shopTutorial": false,
	"alleywayTutorial": false,
	"finishedStory": false
}

enum Scene {Resturant, Shop, Hunting}
var currentScene = Scene.Resturant

func save():
	return {
		"balance": playerBalance,
		"inventory": inventory,
		"progress": progress,
		"currentScene": currentScene
	}

func load(var dict):
	playerBalance = dict["balance"]
	inventory = dict["inventory"]
	progress = dict["progress"]
	currentScene = dict["currentScene"]
