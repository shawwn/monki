local delimiters = {["{"] = true, [")"] = true, ["("] = true, [";"] = true, ["["] = true, ["]"] = true, ["}"] = true, ["\n"] = true}
local whitespace = {["\t"] = true, [" "] = true, ["\n"] = true}
local function stream(str, more)
  return({pos = 0, more = more, string = str, len = _35(str)})
end
local function peek_char(s, count, offset)
  local _id = s
  local pos = _id.pos
  local string = _id.string
  local len = _id.len
  local from = pos + (offset or 0)
  local n = count or 1
  if from <= len - n then
    if n == 1 then
      return(char(string, from))
    else
      return(clip(string, from, from + n))
    end
  end
end
local function read_char(s, count, offset)
  local c = peek_char(s, count, offset)
  if c then
    s.pos = s.pos + _35(c)
    return(c)
  end
end
local function skip_non_code(s)
  while true do
    local c = peek_char(s)
    if nil63(c) then
      break
    else
      if whitespace[c] then
        read_char(s)
      else
        if c == ";" then
          while c and not( c == "\n") do
            c = read_char(s)
          end
          skip_non_code(s)
        else
          break
        end
      end
    end
  end
end
local read_table = {}
local eof = {}
local function read(s)
  skip_non_code(s)
  local c = peek_char(s)
  if is63(c) then
    return((read_table[c] or read_table[""])(s))
  else
    return(eof)
  end
end
local function read_all(s)
  local l = {}
  while true do
    local form = read(s)
    if form == eof then
      break
    end
    add(l, form)
  end
  return(l)
end
local function read_string(str, more)
  local x = read(stream(str, more))
  if not( x == eof) then
    return(x)
  end
end
local function key63(atom)
  return(string63(atom) and _35(atom) > 1 and char(atom, edge(atom)) == ":")
end
local function flag63(atom)
  return(string63(atom) and _35(atom) > 1 and char(atom, 0) == ":")
end
local function expected(s, c)
  local _id1 = s
  local more = _id1.more
  local pos = _id1.pos
  local _id2 = more
  local _e
  if _id2 then
    _e = _id2
  else
    error("Expected " .. c .. " at " .. pos)
    _e = nil
  end
  return(_e)
end
local function wrap(s, x)
  local y = read(s)
  if y == s.more then
    return(y)
  else
    return({x, y})
  end
end
read_table[""] = function (s)
  local str = ""
  while true do
    local c = peek_char(s)
    if c and (not whitespace[c] and not delimiters[c]) then
      str = str .. read_char(s)
    else
      break
    end
  end
  if str == "true" then
    return(true)
  else
    if str == "false" then
      return(false)
    else
      if str == "nan" then
        return(nan)
      else
        if str == "-nan" then
          return(nan)
        else
          if str == "inf" then
            return(inf)
          else
            if str == "-inf" then
              return(-inf)
            else
              if str == "." then
                return("rest:")
              else
                if not number_code63(code(str, edge(str))) then
                  return(str)
                else
                  local n = number(str)
                  if nil63(n) or nan63(n) or inf63(n) then
                    return(str)
                  else
                    return(n)
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
read_table["("] = function (s)
  read_char(s)
  local r = nil
  local l = {}
  while nil63(r) do
    skip_non_code(s)
    local c = peek_char(s)
    if c == ")" then
      read_char(s)
      r = l
    else
      if nil63(c) then
        r = expected(s, ")")
      else
        local x = read(s)
        if key63(x) then
          local k = clip(x, 0, edge(x))
          local v = read(s)
          l[k] = v
        else
          if flag63(x) then
            l[clip(x, 1)] = true
          else
            add(l, x)
          end
        end
      end
    end
  end
  return(r)
end
read_table[")"] = function (s)
  error("Unexpected ) at " .. s.pos)
end
read_table["["] = function (s)
  read_char(s)
  local r = nil
  local l = {}
  while nil63(r) do
    skip_non_code(s)
    local c = peek_char(s)
    if c == "]" then
      read_char(s)
      r = {"fn", {"_"}, l}
    else
      if nil63(c) then
        r = expected(s, "]")
      else
        local x = read(s)
        add(l, x)
      end
    end
  end
  return(r)
end
read_table["]"] = function (s)
  error("Unexpected ] at " .. s.pos)
end
read_table["{"] = function (s)
  read_char(s)
  local r = nil
  local l = {}
  while nil63(r) do
    skip_non_code(s)
    local c = peek_char(s)
    if c == "}" then
      read_char(s)
      r = join({"curly"}, l)
    else
      if nil63(c) then
        r = expected(s, "}")
      else
        local x = read(s)
        add(l, x)
      end
    end
  end
  return(r)
end
read_table["}"] = function (s)
  error("Unexpected } at " .. s.pos)
end
read_table["\"\"\""] = function (s)
  read_char(s, 3)
  local r = nil
  local str = "\""
  while nil63(r) do
    local c = peek_char(s, 3)
    if c == "\"\"\"" then
      read_char(s, 3)
      r = str .. "\""
    else
      if nil63(c) then
        r = expected(s, "\"\"\"")
      else
        local x = read_char(s)
        local _e1
        if x == "\"" or x == "\\" then
          _e1 = "\\" .. x
        else
          _e1 = x
        end
        str = str .. _e1
      end
    end
  end
  return(r)
end
read_table["\""] = function (s)
  if peek_char(s, 3) == "\"\"\"" then
    return(read_table["\"\"\""](s))
  end
  read_char(s)
  local r = nil
  local str = "\""
  while nil63(r) do
    local c = peek_char(s)
    if c == "\"" then
      r = str .. read_char(s)
    else
      if nil63(c) then
        r = expected(s, "\"")
      else
        if c == "\\" then
          str = str .. read_char(s)
        end
        str = str .. read_char(s)
      end
    end
  end
  return(r)
end
read_table["||"] = function (s)
  read_char(s, 2)
  local r = nil
  local str = "\""
  while nil63(r) do
    local c = peek_char(s, 2)
    if c == "||" then
      read_char(s, 2)
      r = str .. "\""
    else
      if nil63(c) then
        r = expected(s, "||")
      else
        local x = read_char(s)
        local _e2
        if x == "\"" or x == "\\" then
          _e2 = "\\" .. x
        else
          _e2 = x
        end
        str = str .. _e2
      end
    end
  end
  return(r)
end
read_table["|"] = function (s)
  if peek_char(s, 2) == "||" then
    return(read_table["||"](s))
  end
  read_char(s)
  local r = nil
  local str = "|"
  while nil63(r) do
    local c = peek_char(s)
    if c == "|" then
      r = str .. read_char(s)
    else
      if nil63(c) then
        r = expected(s, "|")
      else
        str = str .. read_char(s)
      end
    end
  end
  return(r)
end
read_table["'"] = function (s)
  read_char(s)
  return(wrap(s, "quote"))
end
read_table["`"] = function (s)
  read_char(s)
  return(wrap(s, "quasiquote"))
end
read_table[","] = function (s)
  read_char(s)
  if peek_char(s) == "@" then
    read_char(s)
    return(wrap(s, "unquote-splicing"))
  else
    return(wrap(s, "unquote"))
  end
end
return({read = read, stream = stream, ["read-string"] = read_string, ["read-all"] = read_all, ["read-table"] = read_table})
