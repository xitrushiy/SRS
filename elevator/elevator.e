note
	description : "Elevator application root class"
	date        : "$Date$"
	revision    : "$Revision$"

class
	ELEVATOR

feature -- Attributes

	cabins: ARRAY[CABIN]
	floors: ARRAY[FLOOR]
	max_floor: FLOOR

create
	make

feature {NONE} -- Initialization
	make
		do

		end


feature -- Initialization

	get_cabin
		do
			Result := cabins[0]
				-- for now we have one-cabine implementation
		end

end