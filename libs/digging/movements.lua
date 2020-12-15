-- This script should be initialized once
-- as every movement is calculated from the initial rotation

Movement = {}

local ROTATIONS = {
    FORWARD = 1,
    LEFT = 2,
    BACKWARD = 3,
    RIGHT = 4
}

local rotation = ROTATIONS.FORWARD

function Movement:turn(desiredRotation)
    local d = desiredRotation % MAX_ROTATION
    local r = rotation % MAX_ROTATION
    local nTurns = (d - r) == 3 and -1 or d - r
    local f = nTurns > 0 and turtle.turnLeft or turtle.turnRight
    rotation = desiredRotation

    for i = 1, math.abs(nTurns), 1
    do
        f()
    end
end

function Movement:move(detectionFn, directionFn, digFn)
    if detectionFn() then
        digFn()
    end
    local moved = directionFn()
    if not moved then
        error("Couldn't move...\nTerminating...")
    end
end

function Movement:forward(n)
    print("Moving forward...")
    Movement:turn(ROTATIONS.FORWARD)
    for i = 1, n, 1 do
        Movement:move(turtle.detect, turtle.forward, turtle.dig)
    end
end

function Movement:backward(n)
    print("Moving back...")
    Movement:turn(ROTATIONS.BACKWARD)
    for i = 1, n, 1 do
        Movement:move(turtle.detect, turtle.forward, turtle.dig)
    end
end

function Movement:up(n)
    print("Moving up...")
    for i = 1, n, 1 do
        Movement:move(turtle.detectUp, turtle.up, turtle.digUp)
    end
end

function Movement:down(n)
    print("Moving down...")
    for i = 1, n, 1 do
        Movement:move(turtle.detectDown, turtle.down, turtle.digDown)
    end
end

function Movement:left(n)
    print("Moving left...")
    Movement:turn(ROTATIONS.LEFT)
    for i = 1, n, 1 do
        Movement:move(turtle.detect, turtle.forward, turtle.dig)
    end
end

function Movement:right(n)
    print("Moving right...")
    Movement:turn(ROTATIONS.RIGHT)
    for i = 1, n, 1 do
        Movement:move(turtle.detect, turtle.forward, turtle.dig)
    end
end

function Movement:vector(x, y, z)
    local xFn = x < 0 and Movement.left or Movement.right
    local yFn = y < 0 and Movement.forward or Movement.back
    local zFn = z < 0 and Movement.down or Movement.up

    xFn({}, x)
    yFn({}, y)
    zFn({}, z)
end