extends "res://weapons/weapon_stats/weapon_stats.gd"

# Brief overview of what the changes in this file do...
# Expands weapon stats

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const MYMOD_LOG = "JohnTheTactician-DetailedWeaponStats" # ! Change `MODNAME` to your actual mod's name


# Called when the node enters the scene tree for the first time.
func _ready():
	ModLoaderUtils.log_info("Ready for weapon deatail stats", MYMOD_LOG)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func get_crit_chance_text(base_stats:Resource)->String:
	var original = .get_crit_chance_text(base_stats)
	
	var modified = original + init_a + str(base_stats.crit_chance)
	
	return modified
