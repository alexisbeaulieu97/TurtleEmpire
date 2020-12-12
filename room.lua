require "patterns"
require "movements"

-- GET ROOM DIMENSIONS
write("Width: ")
local width = read()

write("Depth: ")
local depth = read()

write("Height: ")
local height = read()

if width < 2 or height < 2 or depth < 2 then
    error("Room must be at least 2x2x2")
end

-- DOOR ALIGNMENT
write("Alignment (l=left, c=center, r=right): ")
local alignment = read()

if alignment == 'c' and width % 2 == 0 then
    write("The width is an even number.\nThe door won't be exactly centered.\nContinue? (y/n): ")
    local continue = read()
    if continue ~= 'y' then
        error("Terminating process...")
    end
end

-- Dig door
Movement:forward()
turtle.digUp()

-- Move inside the room
Movement:forward()

-- Go to common starting position
if alignment == 'c' then
    Movement:vector(-(math.floor(width / 2) - (1 - width % 2) - 1), 0, 0)
elseif alignment == 'r' then
    Movement:vector(-(width - 2), 0, 0)
elseif alignment == 'l' then
    turtle.turnRight()
    Movement:forward()
    turtle.turnLeft()
end

local alternateRotation = false
local alternateK = false

for j = 1, depth, 1 do
    for i = 1, width, 1 do
        local verticalMovement = alternateK and Movement.down or Movement.up
        for k = 1, height, 1 do
            -- Dig
            turtle.
            -- Move
            verticalMovement()
        end
        Movement:forward()
        alternateK = not alternateK
    end
    local rotation = alternateRotation and turtle.turnLeft or turtle.turnRight
    rotation()
    Movement.forward()
    if x + 1 ~= width then
        Movement.forward()
    end
    rotation()
    alternateRotation = not alternateRotation
end

-- Si on est à gauche complètement, on me mine pas à gauche
-- Si on est à droite complètement, on ne mine pas à droite/gauche selon l'orientation
-- Si on est en bas, on ne mine pas en bas
-- Si on est en haut, on ne mine pas en haut

-- On part à 1,0,0
-- Dig gauche, droite
-- monte dig, monte dig, ...
-- avance dig
-- descend dig, descend dig, ...
-- avance dig