note
	description: "Summary description for {CABIN}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	CABIN

feature -- Attributes

	current_floor: FLOOR
			-- 	current floor of a cabin.

	is_moving: BOOLEAN
			-- 	state of a cabin.

	is_open: BOOLEAN
			-- 	state of a doors.

	target_floor: FLOOR

	buttons: ARRAY[BUTTON]

feature
	move()
		do
			-- from
			-- 		i :=
			-- until

			-- loop
			-- 	target_floor != current_floor
			-- end

		end

	move_one(delta: INTEGER)
		do

		end

	open_doors
		do

		end

	close_doors
		do

		end

	get_position()
		do
			Result: current_floor.id
		end

	get_state()
		do
			Result: is_moving
		end
end
