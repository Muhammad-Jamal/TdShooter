extends Node3D

@export var bullet = preload("res://assets/bullet.tscn")
@export var barrelExit:Node3D
@onready var muzzleFlashLight = $BarrelExit/OmniLight3D
@onready var timer = $BarrelExit/OmniLight3D/Timer

func _input(event):
	if(event.is_action_pressed("shootAction")):
		shoot()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func shoot():
	var instance:Node3D = bullet.instantiate()
	instance.transform = barrelExit.transform
	barrelExit.add_child(instance)
	muzzleFlashLight.light_energy = 1;
	timer.start()


func _on_timer_timeout():
	muzzleFlashLight.light_energy = 0
