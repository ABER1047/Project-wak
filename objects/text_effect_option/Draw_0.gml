/// @description Insert description here
// You can write your code in this editor
if global.key_setting_message = 0 && global.n_to_setting__ = 0
{
var _c_x = obj_camera.v_x/1280
if !instance_exists(master_volume_setting)
{
var xx = camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])*0.5-145*_c_x
var yy = camera_get_view_y(view_camera[0])+(500-100)*_c_x
}
else
{
var xx = camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])*0.5-250*_c_x
var yy = camera_get_view_y(view_camera[0])+(160+64+64+64+64+32+90)*_c_x
}

image_index = global.korean_text

draw_sprite_ext(sprite_index,image_index,xx,yy,image_xscale,image_xscale,0,c_white,1)
draw_text_kl_scale(xx+32*_c_x,yy-10*_c_x,"일부 영어로 표기 되던 텍스트를 한글로 표기",32,9999,0.8,image_blend,0,-1,font0,1/3*_c_x,1/3*_c_x,image_angle)
}