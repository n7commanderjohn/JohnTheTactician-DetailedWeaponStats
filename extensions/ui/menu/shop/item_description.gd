extends ItemDescription

# Brief overview of what the changes in this file do...
# Expands weapon stats

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const MYMOD_LOG = "JohnTheTactician-DetailedWeaponStats" # ! Change `MODNAME` to your actual mod's name
const MOD_DIR = "JohnTheTactician-DetailedWeaponStats/" # name of the folder that this file is in

# ! hard copying these from the Utils and weapon data to prevent crashes
const SECONDARY_FONT_COLOR = Color(234.0 / 255, 226.0 / 255, 176.0 / 255, 1)
const GOLD_COLOR = Color(118.0 / 255, 1, 118.0 / 255, 1)
const GRAY_COLOR_STR = "#555555"
const POS_COLOR_STR = "#00ff00"
const NEG_COLOR_STR = "red"

var col_a = "[color=#" + SECONDARY_FONT_COLOR.to_html() + "]"
var col_neutral_a = "[color=white]"
var col_pos_a = "[color=" + POS_COLOR_STR + "]"
var col_neg_a = "[color=" + NEG_COLOR_STR + "]"
var col_b = "[/color]"
var init_a = " [color=" + GRAY_COLOR_STR + "]| "

# Called when the node enters the scene tree for the first time.
func _ready():
	ModLoaderLog.info("Inside of _ready() of item_description.gd", MYMOD_LOG)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

enum Type{MELEE, RANGED}

func set_item(item_data)->void :
	.set_item(item_data)
	###todo and test
	if item_data is WeaponData:

		var text = ""
		var stats = item_data.stats
		
		# var scaling_stats = item_data.stats.scaling_stats
		# var projectiles = stats.nb_projectiles

		# if item_data.type is Type.MELEE:
		# text += Text.text("DAMAGE_FORMATTED", [col_a + tr("STAT_DAMAGE") + col_b, get_dmg_text_with_scaling_stats(stats, scaling_stats, projectiles)])
		
		var basestats = WeaponService.init_base_stats(stats)
		var critString = "\n" + Text.text("CRITICAL_FORMATTED", [col_a + tr("CRITICAL") + col_b, get_crit_damage_text(stats, basestats), get_crit_chance_text(stats, basestats)])
	
		ModLoaderLog.info("final crit string", critString)
		text += critString
		
		text += "\n" + Text.text("STAT_FORMATTED", [col_a + tr("COOLDOWN") + col_b, get_cooldown_text(stats, basestats)])
		
		ModLoaderLog.info("final appending string", text)
		# return text
		get_weapon_stats().append_bbcode("\n" + text)


func get_col_a(value:float, base_value:float)->String:
	if value > base_value:return col_pos_a
	elif value == base_value:return col_neutral_a
	else :return col_neg_a

func get_crit_damage_text(current_stats, base_stats:Resource)->String:
	var a = get_col_a(current_stats.crit_damage, base_stats.crit_damage)
	return a + "x" + str(current_stats.crit_damage) + col_b

func get_crit_chance_text(current_stats, base_stats:Resource)->String:
	# return a + str(max(current_stats.crit_chance * 100.0, 0)) + col_b

	var crit_chance = current_stats.crit_chance

	# var original = .get_crit_chance_text(base_stats)
	var a = get_col_a(crit_chance, base_stats.crit_chance)
	var original = a + str(max(crit_chance * 100.0, 0)) + col_b
	
	var modified = original if crit_chance == base_stats.crit_chance else original+"%)" + init_a + "(" + str(max(base_stats.crit_chance * 100.0, 0)) + col_b

	# ModLoaderLog.info("original crit string", original)
	# ModLoaderLog.info("modded crit string", modified)
	
	return modified
	
		
	
func get_cooldown_text(current_stats, base_stats:Resource, multiplier:float = 1.0)->String:
	# var cd = current_stats.get_shooting_total_duration()
	# var cd = 0
	# var base_cd = base_stats.cooldown
	# var a = get_col_a( - cd, - base_cd)
	# return a + str(stepify(cd * multiplier, 0.01)) + "s" + col_b

	# var cd = current_stats.shooting_data.duration
	var cd = 0
	var base_cd = base_stats.cooldown
	var a = get_col_a( - cd, - base_cd)

	var original = a + str(stepify(cd * multiplier, 0.01)) + "s"

	var modified = original if cd == base_cd else a + str(stepify(cd * multiplier, 0.01)) + "s" + col_b + init_a + str(stepify(base_cd * multiplier, 0.01)) + "s"  + col_b
	# ModLoaderLog.info("modded cooldown string", modified)

	return modified
