note
	description: "Summary description for {CABIN}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"
	model: is_doors_open

class
	CABIN

create
	make

feature -- Initialization
	make (init_floor: FLOOR; init_elevator: ELEVATOR)
	do
		current_floor := init_floor
		is_moving := false
		is_doors_open := true
		elevator := init_elevator
    ensure
	    floor_set: current_floor = init_floor
	    not_moving: is_moving = false
	    opened: is_doors_open = true
	    elevator_set: elevator = init_elevator
    end

feature -- Attributes

	elevator: ELEVATOR
			-- 	elevator which is seen since elevator created

	current_floor: FLOOR
			-- 	current floor of a cabin.

	is_moving: BOOLEAN
			-- 	state of a cabin.

	is_doors_open: BOOLEAN
			-- 	state of a doors.

	buttons: ARRAY[BUTTON]

feature
	move(target: FlOOR)
		require
			target_not_void: target /= VOID
			cur_floor_not_void: current_floor /= VOID
		local
			i: INTEGER
		do
			if target.id - current_floor.id>0 then
				from
					i := 0
				until
					i > target.id - current_floor.id
					-- will be more than zero
				loop
				 	move_up
				end
			else
				from
					i := 0
				until
					i > current_floor.id - target.id
					-- will be more than zero
				loop
				 	move_down
				end
			end
		end

	move_up
		require
			elevator.floors.count = 6
			current_floor.id > 1
			current_floor.id < 6
		do
			current_floor := elevator.floors[current_floor.id+1]
		end

	move_down
		require
			elevator.floors.count = 6
			current_floor.id > 2
			current_floor.id < 7
		do
			current_floor := elevator.floors[current_floor.id-1]
		end

	open_doors
		require
			not_moving: is_moving = false
			is_closed: is_doors_open = false
			modify_model ("is_doors_open", Current)
		do
			is_doors_open := true
		ensure
			opened: is_doors_open = true
		end

	close_doors
		require
			not_moving: is_moving = false
			is_closed: is_doors_open = true
			modify_model ("is_doors_open", Current)
		do
			is_doors_open := false
		ensure
			opened: is_doors_open = false
	    end

	get_position: INTEGER
		require
			C1: current_floor /= VOID
		do
			Result := current_floor.id
		end

	get_state: BOOLEAN
		do
			Result := is_moving
		end
end
