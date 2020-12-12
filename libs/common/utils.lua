function prototype(func, ...)
    -- Assign args to variable so we can use them
    local args = {...}
    return function()
        -- Unpack the arguments and send them to the function
        return func(unpack(args))
    end
end