Movement = {}

function Movement:turn(nTurns)
    local f
    local n
    if nTurns > 0 then
        f = turtle.turnLeft
        n = nTurns
    else
        f = turtle.turnRight
        n = -nTurns
    end

    for i = 0,n-1,1
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

function Movement:forward()
    print("Moving forward...")
    Movement:move(turtle.detect, turtle.forward, turtle.dig)
end

function Movement:back()
    print("Moving back...")
    Movement:turn(2)
    Movement:move(turtle.detect, turtle.forward, turtle.dig)
end

function Movement:up()
    print("Moving up...")
    Movement:move(turtle.detectUp, turtle.up, turtle.digUp)
end

function Movement:down()
    print("Moving down...")
    Movement:move(turtle.detectDown, turtle.down, turtle.digDown)
end

function Movement:left()
    print("Moving left...")
    Movement:turn(1)
    Movement:move(turtle.detect, turtle.forward, turtle.dig)
end

function Movement:right()
    print("Moving right...")
    Movement:turn(-1)
    Movement:move(turtle.detect, turtle.forward, turtle.dig)
end
