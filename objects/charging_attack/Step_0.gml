/// @description Insert description here
// You can write your code in this editor
image_alpha -= 0.15

if image_alpha <= 0
{
instance_destroy()
}


if cre_effect = 0
{
	if place_meeting(x,y,charging_attack_attacked)
	{
	cre_effect = 1
	sfx_for_multiplayer(guard,0,0.05)
	
	var _my_p = get_my_player()
	var random_dir = _my_p.image_xscale
		if  _my_p != -4 && instance_exists(_my_p)
		{
			repeat(2)
			{
			var _ef = instance_create_depth(_my_p.x-image_xscale*4,_my_p.y+irandom_range(-13,0),_my_p.depth-1,effect_spark)
			_ef.hspeed = irandom_range(5,20)*random_dir
			_ef.vspeed = irandom_range(-4,2)
			}
		}
	}
}