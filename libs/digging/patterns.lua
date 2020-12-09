require "movements"

Patterns = {}

function Patterns:horizontalLine(length, digUp, digDown)
    Movement.forward()
    for i = 0,length-2,1
    do
        if digUp then turtle.digUp() end
        if digDown then turtle.digDown() end
        Movement.forward()
    end
    if digUp then turtle.digUp() end
    if digDown then turtle.digDown() end
end