/// @description Insert description here
// You can write your code in this editor
depth = obj_camera.depth+30


loading_textures_timer++

if loading_textures_timer = 100
{
texturegroup_load("guide_video")
}

if loading_textures_timer = 200
{
loading_draw = 0.1
texturegroup_load("ui")
}

if loading_textures_timer = 225
{
loading_draw = 0.2
texturegroup_load("map_objects")
}

if loading_textures_timer = 230
{
loading_draw = 0.3
texturegroup_load("entities")
}

if loading_textures_timer = 235
{
loading_draw = 0.4
texturegroup_load("boss")
}

if loading_textures_timer = 240
{
loading_draw = 0.5
texturegroup_load("effects")
}

if loading_textures_timer = 245
{
loading_draw = 0.6
texturegroup_load("items")
}

if loading_textures_timer = 250
{
loading_draw = 1
alarm[0] = 1
}


if set_brightness >= 1 && first_guide_timer < 405 && loading_draw = 1
{
first_guide_timer ++

	if first_guide_timer > 400
	{
	global.t_b_alpha = -0.01
	}
	else
	{
	global.t_b_alpha = 10
	obj_camera.v_x = 1280
	obj_camera.v_y = 720
	}
	
	if keyboard_check_pressed(vk_anykey) && first_guide_timer < 240
	{
	first_guide_timer = 240
	}
}


if go_start < 3 && start_alpha > 0.5
{
	if use_keyboard_guide_timer > 0
	{
	use_keyboard_guide_timer ++
	}

	if keyboard_check_pressed(vk_anykey)
	{
	use_keyboard_guide_timer = 0
	use_keyboard_guide_alpha = 0
	}
	
	if use_keyboard_guide_timer > 300
	{
	use_keyboard_guide_alpha += (1 - use_keyboard_guide_alpha)*0.02
	}
}



if set_brightness >= 1 && first_guide_timer > 200
{
wheel_cooltime --
	if start_alpha < 1
	{
	start_alpha += 0.01
	}
	else
	{
		if menu_alpha < 1
		{
		menu_alpha += 0.1
		}
	}

	if start_alpha > 0.85
	{
	var scale = irandom_range(50,100)/500
	var _light_ = instance_create_depth(irandom_range(0,room_width),room_height+irandom_range(100,200),depth-1,obj_light)
	_light_.p_id = id
	_light_.alpha = 0.4*irandom_range(100,200)/100
	_light_.sprite_index = sprite64
	_light_.image_blend = $FF75F2FF
	_light_.light_type = 0
	_light_.image_xscale = scale*10
	_light_.image_yscale = scale*10
	_light_.alarm[1] = 50
	_light_.gravity_direction = 270
	_light_.gravity = 0.2
	_light_.vspeed = 5
	_light_.hspeed = irandom_range(-10,10)/10
	create_buble_effect(0.4,270+irandom_range(-10,10),0,choose(-1)*irandom_range(100,150)/4,0.1,0.1,$FF3E2D24,$FF473021,2,$FF513524,irandom_range(0,room_width),room_height+irandom_range(100,200),depth+21,0,false,false)
	create_buble_effect(0.55,270+irandom_range(-10,10),0,choose(-1)*irandom_range(100,150)/4,0.1,0.1,$FF62D1F7,$FF6C60CD,2,$FF191919,irandom_range(0,room_width),room_height+irandom_range(100,200),depth+20,1,false,false)
	
		if instance_number(start_menu_effect_triangle) <= 15
		{
		var random_cre_val = percentage_k(40)
			if random_cre_val = 1
			{
			var set_xx = choose(-64,room_width+64)
			var set_yy = irandom_range(0,room_height)
			var tri_ef = instance_create_depth(set_xx,set_yy,depth-10,start_menu_effect_triangle)
			tri_ef.set_time = irandom_range(120,240)
			tri_ef.col = choose($FF3E2D24,$FF62D1F7)
			tri_ef.outline = choose(true,false)
			tri_ef.image_xscale = irandom_range(30,100)/300
			}
		}
	}

	set_menu_choose += (t_set_menu_choose - set_menu_choose)*0.1



	if global.never_move_in_setting = 0 && menu_alpha > 0.1 && global.b_alpha < 0.1 && global.show_credits = 0 && global.chat_activity = false && global.show_achievement = 0
	{
		if keyboard_check_pressed(global.skip_key) || keyboard_check_pressed(vk_enter) || keyboard_check_pressed(global.jump_key)
		{
		event_user(0)
		}
	}



	if go_start = 1
	{
		if global.b_alpha > 2
		{
			if global.tutorial != 0
			{
				if really = 0
				{
				global.choice_name[0] = "이어 하기"
				global.choice_name[1] = "세이브 파일 삭제"
				global.choice_name[2] = "뒤로 가기"
				}
				else
				{
				global.choice_name[0] = "취소 하기"
				global.choice_name[1] = "세이브 파일 삭제"
				global.choice_name[2] = -4
				}
		
				if global.choosed > 0
				{
				var sfx_ = audio_play_sound(critical_sfx,0,0)
				audio_sound_gain(sfx_,0.02*global.master_volume*2*global.sfx_volume,0)
				global.choice += (-0.1 - global.choice)*0.2
					if really = 0
					{
						if global.choice_now = 0
						{
						global.choosed = 0
						global.choice_now = 0
						global.b_alpha = 1
						global.choice = 0
						timer_des = 1
						alarm[2] = 120
						}
						
						if global.choice_now = 1
						{
						global.choosed = 0
						global.choice_now = 0
						global.choice = 0
						really = 1
						}
						
						if global.choice_now = 2
						{
						game_restart()
						}
					}
					else
					{
						if global.choice_now = 0
						{
						global.choosed = 0
						global.choice_now = 0
						global.choice = 0
						game_restart()
						}
						else
						{
						global.choice = 0
						global.choosed = 0
						file_delete("Project_wak_beta_04.ini")
						save_and_load_data(1,0)
						alarm[10] = 30
						}
					}
				}
				else
				{
					if timer_des = 0
					{
					global.choice += (1.001 - global.choice)*0.2
					}
				}
			}
			else
			{
			room_goto(tuto_room)
			}
		
		global.cursor = 0
		}
	}

	if go_start = 4
	{
		if global.b_alpha > 2
		{
			if global.story_text_alpha <= 2 && timer_st <= 60
			{
			global.story_text_alpha += 0.01
				if keyboard_check(global.skip_key)
				{
				global.story_text_alpha += 0.01
				}
			}
		
			if global.story_text_alpha >= 1.4
			{
			timer_st ++
			}
		
			if timer_st > 0
			{
				if timer_st > 60
				{
				global.story_text_alpha -= 0.01
				
					if keyboard_check(global.skip_key)
					{
					global.story_text_alpha -= 0.01
					}
				
					if global.story_text_alpha <= 0 && global.story_next < 100
					{
					timer_st = 0
					global.story_next ++
				
						if global.story_next >= 3
						{
						room_goto(tuto_room)
						code_stotyline.alarm[3] = 1
						global.cursor = 0
						global.story_next = 100
						}
					}
				}
			}
		}
	}

	if go_start = 2
	{
		if global.b_alpha > 2
		{
		go_start = 3
		t_set_menu_choose = 3
		global.t_b_alpha = -0.01
		}
	}


	if t_set_menu_choose < 0
	{
	t_set_menu_choose = 5
	}

	if t_set_menu_choose > 5
	{
	t_set_menu_choose = 0
	}
}
else
{
global.room_brightness = 0.35
timer ++
	if global.b_alpha < 1
	{
	first_guide_timer = 0
		if set_brightness = 0
		{
			if !instance_exists(brightness_setting___)
			{
			instance_create_depth(x,y,-9998,brightness_setting___)
			var arrow__ = instance_create_depth(510,270,light_code.depth+15,brightness_setting_wall)
	
			var arrow__ = instance_create_depth(510,270,light_code.depth+5,obj_hint_arrow)
			arrow__.image_xscale = 2
			arrow__.image_yscale = 2
			}
		}
		
		if set_brightness = 0.3
		{
			if !instance_exists(text_effect_option)
			{
			instance_create_depth(x,y,-9999,text_effect_option)
			}
		}
		
		if set_brightness = 0.6
		{
			if !instance_exists(certain_music_off)
			{
			instance_create_depth(x,y,-9999,certain_music_off)
			show_debug_message("created")
			}
		}
		
		if set_brightness = 0.9
		{
			if !instance_exists(obj_namebar)
			{
			instance_create_depth(x,y,-9999,obj_namebar)
			}
		}
	}
	
	if timer > 250 && brightness_set_alpha < 1
	{
	brightness_set_alpha += 0.05
	}
	
	if global.difficulty != -4
	{
	global.b_alpha = 10
	global.room_brightness = 0.6
	set_brightness = 1
	use_keyboard_guide_timer = 1
	instance_destroy(brightness_setting___)
	instance_destroy(obj_hint_arrow)
	instance_destroy(brightness_setting_wall)
	instance_destroy(text_effect_option)
	instance_destroy(obj_namebar)
	instance_destroy(certain_music_off)
	}
	
 	if global.b_alpha < 0.5 && ((!instance_exists(obj_namebar) && keyboard_check_pressed(global.skip_key)) || (instance_exists(obj_namebar) && keyboard_check_pressed(vk_enter)))
	{
	instance_destroy(brightness_setting___)
	instance_destroy(obj_hint_arrow)
	instance_destroy(brightness_setting_wall)
	instance_destroy(text_effect_option)
	instance_destroy(obj_namebar)
	instance_destroy(certain_music_off)
	global.b_alpha = 10
	global.room_brightness = 0.6
	brightness_set_alpha = 0
	use_keyboard_guide_timer = 1
		if set_brightness < 1
		{
		set_brightness += 0.3
		}
	}
	
}
