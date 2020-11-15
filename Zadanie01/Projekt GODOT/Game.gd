extends Node

var defaultTimeBetweenEnemies = 1.5 as float
var timeBetweenEnemies = 1.5 as float
var timeBetweenEnemiesDecrease = 0.1 as float
var minimumTimeBetweenEnemies = 0.3 as float
var safeZoneRadius = 300
var startingLifes = 4
var lifes = 2
var score = 0
var scoreForKillingEnemy = 10
var gameInProgress = false;

var enemyScene
var playerScene
var player

# Called when the node enters the scene tree for the first time.
func _ready():
	enemyScene = load("res://Enemy.tscn")
	$EnemyTimer.set_wait_time(timeBetweenEnemies)

#every frame---------------------------------------
func _process(delta):
	UpdateLabels()

func UpdateLabels():
	if gameInProgress:
		$HUD.UpdateLifeLabel(lifes)
		$HUD.UpdateScoreLabel(score)
#------------------------------------------------

#every enemy timer tick:-----------------------
func _on_EnemyTimer_timeout():
	if gameInProgress:
		InstantiateEnemy()
		if timeBetweenEnemies > minimumTimeBetweenEnemies:
			timeBetweenEnemies = timeBetweenEnemies - timeBetweenEnemiesDecrease


func InstantiateEnemy():
	var enemy = enemyScene.instance()
	add_child(enemy)
	enemy.add_to_group("Enemy")
	enemy.position = GenerateEnemyPosition()
	enemy.look_at($Player.position)


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
#---------------------------------------------------------------

#every scoretimer tick:-------------------------------

func _on_ScoreTimer_timeout():
	if gameInProgress:
		score = score + 1
#---------------------------------------------------------

#buttons & setup:-----------------------------------
func _on_HUD_buttonPressed():
	SetUpNewGame()

func _on_HUD_newGameButtonPressed():
	SetUpNewGame()

func SetUpNewGame():
	lifes = startingLifes
	score = 0
	timeBetweenEnemies = defaultTimeBetweenEnemies
	gameInProgress = true
	$HUD.GameOverLabelActive(false)
	$Player.show()
	$Player.Active(true)
	$EnemyTimer.start()
	
func GameOver():
	gameInProgress = false
	$Player.hide()
	$Player.Active(false)
	$EnemyTimer.stop()
	$HUD.GameOverLabelActive(true)
	DestroyAllEnemies()
	

func DestroyAllEnemies():
	for child in get_children():
		if child.is_in_group("Enemy"):
			child.queue_free()

#-----------------------------------

#called by Player:----------------

func _on_Player_hit_by_projectile():
	lifes = lifes - 1
	if lifes < 1:
		UpdateLabels()
		GameOver()


func _on_Player_killed_enemy():
	score = score + scoreForKillingEnemy
	
#--------------------------------------
