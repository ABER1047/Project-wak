/// @description Insert description here
// You can write your code in this editor
if (global.key_setting_message = 0 || pressed = 1) && global.n_to_setting__ = 2
{
var _c_x = obj_camera.v_x/1280
var xx = camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])*0.5
var yy = camera_get_view_y(view_camera[0])+(160+48+48+48)*_c_x

var console_key = keyconverter(global.guard_key)

if global.guard_key = vk_shift
{
draw_text_kl_scale(xx,yy-10*_c_x,"Shift",16,999,0.8,image_blend,1,0,font0,1/3*_c_x,1/3*_c_x,image_angle)
}
else if global.guard_key = vk_up || global.console_mode = 1
{
draw_text_kl_scale(xx-8*_c_x,yy,"->",16,999,0.8,image_blend,1,0,font0,1/3*_c_x,1/3*_c_x,90)
}
else
{
draw_text_kl_scale(xx,yy-10*_c_x,string(console_key),16,999,0.8,image_blend,1,0,font0,1/3*_c_x,1/3*_c_x,image_angle)
}

draw_sprite_ext(sprite_index,image_index,xx,yy,image_xscale,image_xscale,0,c_white,1)
draw_text_kl_scale(xx+32*_c_x,yy-10*_c_x,"가드",16,999,0.8,image_blend,0,-1,font0,1/3*_c_x,1/3*_c_x,image_angle)
}