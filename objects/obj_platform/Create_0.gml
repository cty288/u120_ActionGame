/// @description Insert description here
// You can write your code in this editor
delete_in = -1;
is_intact=true;

size=0;

change_size_time=random_range(5,8)*room_speed;
change_size_timer=0;

intact_sprites[0]=spr_cloud_small;
intact_sprites[1]=spr_cloud_medium;
intact_sprites[2]=spr_cloud_large;
intact_sprites[3]=spr_cloud_huge;

debris_sprites[0]=spr_cloud_small_debris;
debris_sprites[1]=spr_cloud_medium_debris;
debris_sprites[2]=spr_cloud_large_debris;
debris_sprites[3]=spr_cloud_huge_debris;

image_speed=1;
image_index=0;

function OnBounced(){
	is_intact=false;
	sprite_index=debris_sprites[size];
	image_index=0;
	image_speed=1;
	delete_in=0.5*room_speed;
}



