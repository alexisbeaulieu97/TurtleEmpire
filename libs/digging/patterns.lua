require "movements"

Patterns = {}

function Patterns:horizontalLine(length, digUp, digDown)
    digUp = digUp or false
    digDown = digDown or false
    for i = 0,length-1,1
    do
        if digUp then turtle.digUp() end
        if digDown then turtle.digDown() end
        Movement.forward()
    end
    if digUp then turtle.digUp() end
    if digDown then turtle.digDown() end
end

function Patterns:digHorizontal(rotation)
    Movement:turn(rotation)
    turtle.dig()
    Movement:turn(-rotation)
end

function Patterns:belt()
    for i = 0,3,1
    do
        turtle.dig()
        Movement:turn(1)
    end
end

function Patterns:allSides()
    turtle.digUp()
    turtle.digDown()
    Patterns:belt()
end

function Patterns:custom(left, right, up, down, front, back)
    if up then
        turtle.digUp()
    end

    if down then
        turtle.digDown()
    end

    sides = {front, left, back, right}

    for i = 1,4,1
    do
        if sides[i] then
            turtle.dig()
        end
        Movement:turn(1)
    end
end

function Patterns:curry(func, ...)
    return function(...)
        -- todo find a way to unpack, or hardcode the num of arguments :c
        return func(unpack(...))
    end
end