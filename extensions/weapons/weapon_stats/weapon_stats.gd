extends "res://weapons/weapon_stats/weapon_stats.gd"

# Brief overview of what the changes in this file do...
# Expands weapon stats

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const MYMOD_LOG = "JohnTheTactician-DetailedWeaponStats" # ! Change `MODNAME` to your actual mod's name


# Called when the node enters the scene tree for the first time.
func _ready():
	ModLoaderLog.info("Ready for weapon detail stats", MYMOD_LOG)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func get_crit_chance_text(base_stats:Resource)->String:
	var original = .get_crit_chance_text(base_stats)
	# var a = get_col_a(crit_chance, base_stats.crit_chance)
	# return a + str(max(crit_chance * 100.0, 0)) + col_b
	
	var modified = original if crit_chance == base_stats.crit_chance else original+"%)" + init_a + "(" + str(max(base_stats.crit_chance * 100.0, 0))
	ModLoaderLog.info("modded crit string", modified)
	
	return modified
