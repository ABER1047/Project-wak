/// @description Insert description here
// You can write your code in this editor
owner_surface = surface_create(1920,1080)

image_speed = 0
image_index = 0
image_xscale = 3
depth = 999

show_mes = 0
global.save_point_x = 637
global.save_point_y = 1100

global.platform_speed = 0
global.never_move = 0
obj_chatbox.new_chat = 0

global.room_brightness = 0.78

b_alpha = 0
timer = 0
sfx = 0

if global.story_next < 100
{
player.x = 800
}
player.y = 1100
global.n_time = 12
if global.show_credits = 0 && global.story_next < 100
{
explo_anime = 0.1
}
else
{
explo_anime = 0
}
instance_create_depth(x,y,depth,outside_water)


var warning_guide = instance_create_depth(654,1033,0,obj_warning)
warning_guide.warning_message = "-관계자 외 출입 금지-"