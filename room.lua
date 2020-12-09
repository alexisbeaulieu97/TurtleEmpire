require "patterns"
require "movements"

-- GET ROOM DIMENSIONS
write("Width: ")
local width = read()

write("Depth: ")
local depth = read()

write("Height: ")
local height = read()

-- DOOR ALIGNMENT
write("Alignment (l=left, c=center, r=right): ")
local alignment = read()

if alignment == 'c' and width % 2 == 0 then
    write("The width is an even number.\nThe door won't be exactly centered.\nContinue? (y/n): ")
    local continue = read()
    if continue ~= 'o' then
        error("Terminating process...")
    end

    -- Get to level
    Movement:up()
    -- Dig door
    Movement:forward()
    turtle.digUp()
    turtle.digDown()
    -- Move inside room
    Movement:forward()
    -- TODO move to a common starting position for all 3 door alignment options
    --turtle.turnLeft()
    --Patterns:horizontalLine(math.floor(width / 2) - (1 - width % 2))
    --turtle.turnRight()
end

-- TODO DIG