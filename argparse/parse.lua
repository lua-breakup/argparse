local function is_switch(argument)
    return string.sub(argument, 0, 2) == "--"
end

local function string_split(str, sep)
   local sep, fields = sep or ":", {}
   local pattern = string.format("([^%s]+)", sep)
   str:gsub(pattern, function(c) fields[#fields+1] = c end)
   return fields
end

local function switch_value(argument)
    return string_split(argument, '=')[2]
end

local function switch_name(argument)
    return string.sub(string_split(argument, '=')[1], 3)
end

local function argparse(arg)
	local args = {}
	for k,v in ipairs(arg) do
	    if switch_value(v) ~= nil then
	        args[switch_name(v)] = switch_value(v)
	    else
	        args[switch_name(v)] = true
	    end
	end
	return args
end

return argparse
