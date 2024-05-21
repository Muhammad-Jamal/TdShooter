extends Node3D

@export var SPEED := 30
@onready var timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position += -global_transform.basis.z * delta * SPEED
	


func _on_timer_timeout():
	queue_free()
