extends Node2D

# NOTE : update this on gravestone.gd if you edit this
enum levels {
    NONE,
    INTRO,
    HUB,
    ONE,
    TWO
}
var Graves_saved = 0

var level_scenes = {
    levels.INTRO : preload("res://Levels/intro_level.tscn"),#.instantiate(),
    levels.HUB : preload("res://Levels/level_graveyard.tscn"),#.instantiate(),
    levels.ONE : preload("res://Levels/level_one.tscn"),#.instantiate(),
    levels.TWO : preload("res://Levels/level_two.tscn")#.instantiate(),
}

func change_level(level : levels):
    if level != levels.NONE:
        print(get_tree().change_scene_to_packed(level_scenes[level]))
