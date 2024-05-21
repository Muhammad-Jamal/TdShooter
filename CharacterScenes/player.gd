extends CharacterBody3D
class_name	Player

var inputVector :Vector2
var playerFaceDirect := Vector3.FORWARD
var theta:float = 0
const GRAVITY := 9.8

@export var playerMoveSpeed := 5
@export var playerJumpHeight := 2
@export var weapon :Weapon


func _physics_process(delta):
	MovePlayer()
	RotatePlayer(delta)
	
func RotatePlayer(delta):
	if(inputVector == Vector2.ZERO):
		return
	theta = atan2(-inputVector.x, -inputVector.y)
	print(theta)
	rotation.y = lerp_angle(rotation.y, theta, delta * 10)
	
func MovePlayer():
	inputVector = Input.get_vector("moveLeft","moveRight","moveForward","moveBack")
	velocity.z = inputVector.y * playerMoveSpeed
	velocity.x = inputVector.x * playerMoveSpeed
	if (not is_on_floor()):
		velocity.y = -GRAVITY
	move_and_slide()	
