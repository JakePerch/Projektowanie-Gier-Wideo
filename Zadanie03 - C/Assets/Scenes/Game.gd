extends Control

var number
var highGuesses = []
var lowGuesses = []

func _ready():
	number = GenerateRandomNumber()
	highGuesses = []
	lowGuesses = []
	SetLabel("")
	$UI/HighList.text = ""
	$UI/LowList.text = ""
	$UI/RestartButton.visible = false
	$UI/CorrectAnswer.visible = false
	$UI/LineEdit.visible = true
	$UI/Button.visible = true

#func _process(delta):
	
func _input(event):
	if event.is_action_pressed("ui_accept"):
		CheckNumber()

func GenerateRandomNumber():
	randomize()
	return randi() % 100 + 1

func CheckNumber():
	var toCheck = int($UI/LineEdit.text)
	if not CheckIfInRange(toCheck):
		SetLabel("Not in range...")
	elif CheckIfCorrect(toCheck):
		SetLabel("Correct!")
		CorrectAnswer(toCheck)
	elif CheckIfLarger(toCheck):
		SetLabel("Too Large!")
		AddToHighList(toCheck)
	else:
		SetLabel("Too Small!")
		AddToLowList(toCheck)
	$UI/LineEdit.text = ""
		
func CheckIfInRange(var toCheck):
	if toCheck >= 1 and toCheck <= 100:
		return true
	else:
		return false

func CheckIfCorrect(var toCheck):
	if toCheck == number:
		return true
	else:
		return false

func CheckIfLarger(var toCheck):
	if toCheck > number:
		return true
	else:
		return false
		
func SetLabel(var message):
	$UI/AnswerLabel.text = message

func AddToHighList(var toAdd):
	if highGuesses.find(toAdd) == -1:
		highGuesses.append(toAdd)
		$UI/HighList.text += str(toAdd) + " "

func AddToLowList(var toAdd):
	if lowGuesses.find(toAdd) == -1:
		lowGuesses.append(toAdd)
		$UI/LowList.text += str(toAdd) + " "

func CorrectAnswer(var answer):
	$UI/RestartButton.visible = true
	$UI/LineEdit.visible = false;
	$UI/Button.visible = false
	$UI/CorrectAnswer.visible = true
	$UI/CorrectAnswer.text = str(answer)

func _on_Button_pressed():
	CheckNumber()

func _on_RestartButton_pressed():
	_ready()


func _on_BackButton_pressed():
	get_tree().change_scene("res://Assets/Scenes/MainMenu.tscn")
