Patterns = {}

function tprint (tbl, indent)
    if not indent then indent = 0 end
    for k, v in pairs(tbl) do
      formatting = string.rep("  ", indent) .. k .. ": "
      if type(v) == "table" then
        print(formatting)
        tprint(v, indent+1)
      elseif type(v) == 'boolean' then
        print(formatting .. tostring(v))
      else
        print(formatting .. v)
      end
    end
  end

function Patterns:custom(left, right, up, down, front, back)
    print("it worked")
    print(left)
    print(right)
    print(up)
    print(down)
    print(front)
    print(back)
end

function Patterns:prototype(func, ...)
    local args = {...}
    return function()
        -- todo find a way to unpack, or hardcode the num of arguments :c
        return func(unpack(args))
    end
end

test = Patterns:prototype(Patterns.custom, {}, false, true, true, true, true, false)
print(test())
print(test())