extends Node2D

var dialogue_1 = [
	{
		"Name": "John",
		"Choices": ["",""],
		"Text": "Hello, this is a test",
	},
	{
		"Name": "Chore",
		"Choices": ["First","Second"],
		"Text": "Testing choices",
	},
	#Any option with choices needs to be written twice and I only kinda know why -Weston
	{
		"Name": "Chore",
		"Choices": ["First","Second"],
		"Text": "Testing choices",
	}
]

var after_choice_1 = [
	{
		"Name": "John",
		"Choices": ["",""],
		"Text": "Yippee",
	},
	{
		"Name": "Chore",
		"Choices": ["",""],
		"Text": "Yappee",
	}
]

var after_choice_2 = [
	{
		"Name": "John",
		"Choices": ["",""],
		"Text": "Wahooo",
	},
	{
		"Name": "Chore",
		"Choices": ["",""],
		"Text": "Weeeeheee",
	}
]
