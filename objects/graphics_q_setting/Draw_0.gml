/// @description Insert description here
// You can write your code in this editor
if global.n_to_setting__ = 0
{
var _c_x = obj_camera.v_x/1280
var xx = camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])*0.5-80*_c_x
var yy = camera_get_view_y(view_camera[0])+(160-20)*_c_x

draw_sprite_ext(sprite_index,1,xx,yy,_c_x,_c_x,0,c_white,1)
draw_sprite_ext(sprite_index,image_index,xx+global.graphics*200*_c_x,yy,_c_x,_c_x,0,c_white,1)


if global.korean_text = 1
{
var text__ = "높음"
	if global.graphics_for_code = 1
	{
	text__ = "낮음\n\n(일부 공격이 작아 보일 수 있으나, 판정은 변하지 않습니다)"
	}

	if global.graphics_for_code = 2
	{
	text__ = "중간"
	}
}
else
{
var text__ = "High"
	if global.graphics_for_code = 1
	{
	text__ = "Low\n\n(일부 공격이 작아 보일 수 있으나, 판정은 변하지 않습니다)"
	}

	if global.graphics_for_code = 2
	{
	text__ = "Medium"
	}
}


draw_text_kl_scale(xx+220*_c_x,yy-10*_c_x,text__,64*_c_x,9999,0.8,image_blend,0,-1,font0,1/3*_c_x,1/3*_c_x,image_angle)
draw_text_kl_scale(xx-128*_c_x,yy-10*_c_x,"그래픽 퀄리티 ",16,9999,0.8,image_blend,0,-1,font0,1/3*_c_x,1/3*_c_x,image_angle)
}