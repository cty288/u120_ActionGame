randomize();

max_platforms=20;
initial_platform=5;

platform_max_height=room_height-100;
platform_min_height=200;

platform_initial_min_height=room_height-600
platform_initial_max_height=room_height-100;

current_platform=0;

platform_generate_time = random_range(0.5*room_speed,1*room_speed);
platform_generate_timer = 0;


var spawn_x = random_range(0,room_width - 64);
var spawn_y = 3000;

instance_create_layer(spawn_x,spawn_y,"Instances",obj_player_1);
instance_create_layer(spawn_x,spawn_y,"Instances",obj_player_2);

//Spawn some platforms at the beginning of the game
alarm[0] = 0.1*room_speed;



function SpawnPlatforms(number,min_height,max_height){
	for(var i=0; i<number;i++){
		var spawn_x = random_range(64,room_width - 64);
		var spawn_y = random_range(min_height,max_height);
		show_debug_message(spawn_y);
	
		var new_platform = instance_create_layer(spawn_x, spawn_y, "Instances", obj_platform);
		with(new_platform){
			var attempts=0;
			while((collision_rectangle(x-256,y-128,x,y,obj_platform,true,true)!=noone ||
			collision_rectangle(x,y-128,x+256,y,obj_platform,true,true)!=noone ||
			collision_rectangle(x-256,y+128,x,y,obj_platform,true,true)!=noone || 
			collision_rectangle(x,y,x+256,y+128,obj_platform,true,true)!=noone) &&
			attempts <1000){
				 x = random_range(64,room_width - 64);
				 y = random_range(min_height,max_height);
				 attempts++;
				 
				 if(attempts==1000){
					instance_destroy();
				 }
			}
		}
	}

}