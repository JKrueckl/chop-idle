extends Control

func _ready():
    $StartButton.pressed.connect(_on_start_pressed)
    $RestartButton.pressed.connect(_on_restart_pressed)
    $QuitButton.pressed.connect(_on_quit_pressed)
    $WoodRain.set_script(load("res://scripts/WoodRain.gd"))

func _on_start_pressed():
    get_tree().change_scene_to_file("res://scenes/Game.tscn")

func _on_restart_pressed():
    # TODO: Implement restart logic
    print("Restart Game")

func _on_quit_pressed():
    get_tree().quit()
