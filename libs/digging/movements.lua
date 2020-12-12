Movement = {}

function Movement:turn(nTurns)
    local f = nTurns > 0 and turtle.turnLeft or turtle.turnRight
    local n = nTurns > 0 and nTurns or -nTurns

    for i = 1, n, 1
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
    for i = 1, n, 1 do
        Movement:move(turtle.detect, turtle.forward, turtle.dig)
    end
end

function Movement:back(n)
    print("Moving back...")
    Movement:turn(2)
    for i = 1, n, 1 do
        Movement:move(turtle.detect, turtle.forward, turtle.dig)
    end
    Movement:turn(-2)
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
    Movement:turn(1)
    for i = 1, n, 1 do
        Movement:move(turtle.detect, turtle.forward, turtle.dig)
    end
    Movement:turn(-1)
end

function Movement:right(n)
    print("Moving right...")
    Movement:turn(-1)
    for i = 1, n, 1 do
        Movement:move(turtle.detect, turtle.forward, turtle.dig)
    end
    Movement:turn(1)
end

function Movement:vector(x, y, z)
    local xFn = x < 0 and Movement.left or Movement.right
    local yFn = y < 0 and Movement.forward or Movement.back
    local zFn = z < 0 and Movement.down or Movement.up

    xFn({}, x)
    yFn({}, y)
    zFn({}, z)
end