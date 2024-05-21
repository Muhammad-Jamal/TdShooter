extends Camera3D


@export var player:Player
@export var offset:Vector3
@export var speed:int = 2
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#look_at( player.position.lerp(player.collisionPoint, 0.1) )
	position = position.lerp(player.position + offset, speed * delta)
	#look_at(player.position.lerp(player.collisionPoint,0.1).normalized())
	#position = player.position + offset
