extends Node

var timeBetweenEnemies = 1 as float
var safeZoneRadius = 300
var startingLifes = 4
var lifes = 2
var score = 0
var gameInProgress = true;

var enemyScene
var playerScene
var player

# Called when the node enters the scene tree for the first time.
func _ready():
	enemyScene = load("res://Enemy.tscn")
	
	$EnemyTimer.set_wait_time(timeBetweenEnemies)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	UpdateLabels()


func GenerateEnemyPosition():
	var done = false
	var x
	var y
	var position
	var screenSize = get_viewport().get_size()
	var screenSizeX = screenSize.x
	var screenSizeY = screenSize.y
	
	while !done:
		x = rand_range(0,screenSizeX)
		y = rand_range(0, screenSizeY)
		position = Vector2(x, y)
		if position.distance_to($Player.position) > safeZoneRadius:
			done = true
	
	return position


func InstantiateEnemy():
	var enemy = enemyScene.instance()
	add_child(enemy)
	enemy.add_to_group("Enemy")
	enemy.position = GenerateEnemyPosition()
	enemy.look_at($Player.position)

func _on_EnemyTimer_timeout():
	if gameInProgress:
		InstantiateEnemy()

	
func GameOver():
	gameInProgress = false
	$Player.hide()
	$EnemyTimer.stop()
	$HUD.GameOverLabelActive(true)
	DestroyAllEnemies()
	
func UpdateLabels():
	if gameInProgress:
		$HUD.UpdateLifeLabel(lifes)
		$HUD.UpdateScoreLabel(score)


func _on_ScoreTimer_timeout():
	if gameInProgress:
		score = score + 1
		
func SetUpNewGame():
	lifes = startingLifes
	score = 0
	$HUD.GameOverLabelActive(false)
	$Player.show()
	$EnemyTimer.start()
	gameInProgress = true


func _on_HUD_buttonPressed():
	SetUpNewGame()


func DestroyAllEnemies():
	for child in get_children():
		if child.is_in_group("Enemy"):
			child.queue_free()


func _on_Player_hit_by_projectile():
	lifes = lifes - 1
	if lifes < 1:
		UpdateLabels()
		GameOver()
