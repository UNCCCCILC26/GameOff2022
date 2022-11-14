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


func save():
	return {
		"balance": playerBalance,
		"inventory": inventory
		#TODO: ADD MORE
	}

func load(var dict):
	playerBalance = dict["balance"]
	inventory = dict["inventory"]
