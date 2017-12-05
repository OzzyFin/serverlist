local table = setmetatable({},{__index = table})

table.find = function(t,v)
	for i = 1,#t do
		if t[i] == v then
			return true,i
		end
	end
	return false
end

table.clone = function(t)
	return {unpack(t)}
end

table.deepcopy = function(orig) --== http://lua-users.org/wiki/CopyTable
	local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[table.deepcopy(orig_key)] = table.deepcopy(orig_value)
        end
        setmetatable(copy, table.deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

table.random = function(t)
	return t[math.random(1,#t)]
end

return table