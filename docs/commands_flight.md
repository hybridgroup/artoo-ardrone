# Commands

## start

Starts up the drone.

##### Params

`no params`

##### Returns

`drone`

## stop

Stops the drone.

##### Params

`no params`

##### Returns

`drone` 

## hover

Causes the drone to hover at current altitude.

##### Params

`no params`

##### Returns

`drone` 

## land

Causes the drone to begin its landing sequence.

##### Params

`no params`

##### Returns

`drone` 

## take_off

Causes the drone to take off, if already started.

##### Params

`no params`

##### Returns

`drone` 

## emergency

Causes the drone to make an immediate emergency landing.

##### Params

`no params`

##### Returns

`drone` 

## front_camera

Causes the drone to turn on the front-facing camera.

##### Params

`no params`

##### Returns

`drone` 

## bottom_camera

Causes the drone to turn on the bottom-facing camera.

##### Params

`no params`

##### Returns

`drone` 

## up

Causes the drone to increase altitude.

##### Params

`no params`

##### Returns

`drone` 

## down

Causes the drone to decrease altitude.

##### Params

`no params`

##### Returns

`drone` 

## left

Causes the drone to bank to the left.

##### Params

`no params`

##### Returns

`drone` 

## right

Causes the drone to bank to the right.

##### Params

`no params`

##### Returns

`drone` 

## forward

Causes the drone to bank forward.

##### Params

`no params`

##### Returns

`drone` 

## backward

Causes the drone to bank backward.

##### Params

`no params`

##### Returns

`drone` 

## turn_left

Causes the drone to rotate to the left.

##### Params

`no params`

##### Returns

`drone` 

## turn_right

Causes the drone to rotate to the right.

##### Params

`no params`

##### Returns

`drone` 

## reset_watchdog

Reset the watchdog in the drone.

##### Params

`no params`

##### Returns

`drone` 

## led(color_animation, strength, duration)

Turn on the drone's built in LEDs with the color_animation passed, strength and duration color_animation might be one of the following: `:blink_green_red`, `:blink_green`, `:blink_red`, `:blink_orange`, `:snake_green_red`, `:fire`, `:standard`, `:red`, `:green`, `:red_snake`, `:blank`, `:right_missile`, `:left_missile`, `:double_missile`, `:front_left_green_others_red`, `:front_right_green_others_red`, `:rear_right_green_others_red`, `:rear_left_green_others_red`, `:left_green_right_red`, `:left_red_right_green`, `:blink_standard`

##### Params

- **color_animation** - params
- **strength** - params
- **duration** - params

##### Returns

`drone` 

## animate(animation, duration) 

Animate the ardrone to do flips and turns depending on selection, available animation options are: `:phi_m30_deg`,`:phi_30_deg`, `:theta_m30_deg`, `:theta_30_deg`, `:theta_20_deg_yaw_200_deg`, `:theta_20_deg_yaw_m_200_deg`, `:turnaround`, `:turnaround_go_down`, `:yaw_shake`, `:yaw_dance`, `:phi_dance`, `:theta_dance`, `:vz_dance`, `:wave`, `:phi_theta_mixed`, `:double_phi_theta_mixed`, `:flip_ahead`, `:flip_behind`, `:flip_left`, `:flip_right`

##### Params

- **animation** - params
- **duration** - params

##### Returns

`drone` 


