/// @description Insert description here
// You can write your code in this editor
if(keyboard_check_pressed(ord("R"))){
	room_restart();
}

//generate platforms 
platform_generate_timer++;
if(platform_generate_timer>=platform_generate_time){
	platform_generate_timer=0;
	platform_generate_time = random_range(0.5*room_speed,1*room_speed);
	if(current_platform<max_platforms){
		SpawnPlatforms(1,platform_min_height,platform_max_height);
	}
}


current_platform=instance_number(obj_platform);
