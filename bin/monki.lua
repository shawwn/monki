environment = {{}}
target = "lua"
local ssub = string.sub
local sbyte = string.byte
local sfind = string.find
local tinsert = table.insert
local tremove = table.remove
local tsort = table.sort
local tunpack = table.unpack
function nil63(x)
  return(x == nil)
end
function is63(x)
  return(not nil63(x))
end
function _35(x)
  return(#x)
end
function none63(x)
  return(_35(x) == 0)
end
function some63(x)
  return(_35(x) > 0)
end
function one63(x)
  return(_35(x) == 1)
end
function two63(x)
  return(_35(x) == 2)
end
function hd(l)
  return(l[1])
end
function string63(x)
  return(type(x) == "string")
end
function number63(x)
  return(type(x) == "number")
end
function boolean63(x)
  return(type(x) == "boolean")
end
function function63(x)
  return(type(x) == "function")
end
function obj63(x)
  return(is63(x) and type(x) == "table")
end
function atom63(x)
  return(nil63(x) or string63(x) or number63(x) or boolean63(x))
end
nan = 0 / 0
inf = 1 / 0
function nan63(n)
  return(not( n == n))
end
function inf63(n)
  return(n == inf or n == -inf)
end
function clip(s, from, upto)
  return(ssub(s, from + 1, upto))
end
function cut(x, from, upto)
  local l = {}
  local j = 0
  local _e
  if nil63(from) or from < 0 then
    _e = 0
  else
    _e = from
  end
  local i = _e
  local n = _35(x)
  local _e1
  if nil63(upto) or upto > n then
    _e1 = n
  else
    _e1 = upto
  end
  local _upto = _e1
  while i < _upto do
    l[j + 1] = x[i + 1]
    i = i + 1
    j = j + 1
  end
  local _o = x
  local k = nil
  for k in next, _o do
    local v = _o[k]
    if not number63(k) then
      l[k] = v
    end
  end
  return(l)
end
function keys(x)
  local t = {}
  local _o1 = x
  local k = nil
  for k in next, _o1 do
    local v = _o1[k]
    if not number63(k) then
      t[k] = v
    end
  end
  return(t)
end
function edge(x)
  return(_35(x) - 1)
end
function inner(x)
  return(clip(x, 1, edge(x)))
end
function tl(l)
  return(cut(l, 1))
end
function char(s, n)
  return(clip(s, n, n + 1))
end
function code(s, n)
  local _e2
  if n then
    _e2 = n + 1
  end
  return(sbyte(s, _e2))
end
function string_literal63(x)
  return(string63(x) and char(x, 0) == "\"")
end
function id_literal63(x)
  return(string63(x) and char(x, 0) == "|")
end
function add(l, x)
  return(tinsert(l, x))
end
function drop(l)
  return(tremove(l))
end
function last(l)
  return(l[edge(l) + 1])
end
function almost(l)
  return(cut(l, 0, edge(l)))
end
function reverse(l)
  local l1 = keys(l)
  local i = edge(l)
  while i >= 0 do
    add(l1, l[i + 1])
    i = i - 1
  end
  return(l1)
end
function reduce(f, x)
  if none63(x) then
    return(x)
  else
    if one63(x) then
      return(hd(x))
    else
      return(f(hd(x), reduce(f, tl(x))))
    end
  end
end
function join(...)
  local ls = unstash({...})
  if two63(ls) then
    local _id = ls
    local a = _id[1]
    local b = _id[2]
    if a and b then
      local c = {}
      local o = _35(a)
      local _o2 = a
      local k = nil
      for k in next, _o2 do
        local v = _o2[k]
        c[k] = v
      end
      local _o3 = b
      local k = nil
      for k in next, _o3 do
        local v = _o3[k]
        if number63(k) then
          k = k + o
        end
        c[k] = v
      end
      return(c)
    else
      return(a or b or {})
    end
  else
    return(reduce(join, ls))
  end
end
function find(f, t)
  local _o4 = t
  local _i4 = nil
  for _i4 in next, _o4 do
    local x = _o4[_i4]
    local y = f(x)
    if y then
      return(y)
    end
  end
end
function first(f, l)
  local _x2 = l
  local _n5 = _35(_x2)
  local _i5 = 0
  while _i5 < _n5 do
    local x = _x2[_i5 + 1]
    local y = f(x)
    if y then
      return(y)
    end
    _i5 = _i5 + 1
  end
end
function in63(x, t)
  return(find(function (y)
    return(x == y)
  end, t))
end
function pair(l)
  local l1 = {}
  local i = 0
  while i < _35(l) do
    add(l1, {l[i + 1], l[i + 1 + 1]})
    i = i + 1
    i = i + 1
  end
  return(l1)
end
function sort(l, f)
  tsort(l, f)
  return(l)
end
function map(f, x)
  local t = {}
  local _x4 = x
  local _n6 = _35(_x4)
  local _i6 = 0
  while _i6 < _n6 do
    local v = _x4[_i6 + 1]
    local y = f(v)
    if is63(y) then
      add(t, y)
    end
    _i6 = _i6 + 1
  end
  local _o5 = x
  local k = nil
  for k in next, _o5 do
    local v = _o5[k]
    if not number63(k) then
      local y = f(v)
      if is63(y) then
        t[k] = y
      end
    end
  end
  return(t)
end
function keep(f, x)
  return(map(function (v)
    if f(v) then
      return(v)
    end
  end, x))
end
function keys63(t)
  local _o6 = t
  local k = nil
  for k in next, _o6 do
    local v = _o6[k]
    if not number63(k) then
      return(true)
    end
  end
  return(false)
end
function empty63(t)
  local _o7 = t
  local _i9 = nil
  for _i9 in next, _o7 do
    local x = _o7[_i9]
    return(false)
  end
  return(true)
end
function stash(args)
  if keys63(args) then
    local p = {}
    local _o8 = args
    local k = nil
    for k in next, _o8 do
      local v = _o8[k]
      if not number63(k) then
        p[k] = v
      end
    end
    p._stash = true
    add(args, p)
  end
  return(args)
end
function unstash(args)
  if none63(args) then
    return({})
  else
    local l = last(args)
    if not atom63(l) and l._stash then
      local args1 = almost(args)
      local _o9 = l
      local k = nil
      for k in next, _o9 do
        local v = _o9[k]
        if not( k == "_stash") then
          args1[k] = v
        end
      end
      return(args1)
    else
      return(args)
    end
  end
end
function search(s, pattern, start)
  local _e3
  if start then
    _e3 = start + 1
  end
  local _start = _e3
  local i = sfind(s, pattern, _start, true)
  return(i and i - 1)
end
function split(s, sep)
  if s == "" or sep == "" then
    return({})
  else
    local l = {}
    local n = _35(sep)
    while true do
      local i = search(s, sep)
      if nil63(i) then
        break
      else
        add(l, clip(s, 0, i))
        s = clip(s, i + n)
      end
    end
    add(l, s)
    return(l)
  end
end
function cat(...)
  local xs = unstash({...})
  if none63(xs) then
    return("")
  else
    return(reduce(function (a, b)
      return(a .. b)
    end, xs))
  end
end
function _43(...)
  local xs = unstash({...})
  return(reduce(function (a, b)
    return(a + b)
  end, xs))
end
function _(...)
  local xs = unstash({...})
  return(reduce(function (b, a)
    return(a - b)
  end, reverse(xs)))
end
function _42(...)
  local xs = unstash({...})
  return(reduce(function (a, b)
    return(a * b)
  end, xs))
end
function _47(...)
  local xs = unstash({...})
  return(reduce(function (b, a)
    return(a / b)
  end, reverse(xs)))
end
function _37(...)
  local xs = unstash({...})
  return(reduce(function (b, a)
    return(a % b)
  end, reverse(xs)))
end
function _62(a, b)
  return(a > b)
end
function _60(a, b)
  return(a < b)
end
function _61(a, b)
  return(a == b)
end
function _6261(a, b)
  return(a >= b)
end
function _6061(a, b)
  return(a <= b)
end
function number(s)
  return(tonumber(s))
end
function number_code63(n)
  return(n > 47 and n < 58)
end
function numeric63(s)
  local n = _35(s)
  local i = 0
  while i < n do
    if not number_code63(code(s, i)) then
      return(false)
    end
    i = i + 1
  end
  return(true)
end
function escape(s)
  local s1 = "\""
  local i = 0
  while i < _35(s) do
    local c = char(s, i)
    local _e4
    if c == "\n" then
      _e4 = "\\n"
    else
      local _e5
      if c == "\"" then
        _e5 = "\\\""
      else
        local _e6
        if c == "\\" then
          _e6 = "\\\\"
        else
          _e6 = c
        end
        _e5 = _e6
      end
      _e4 = _e5
    end
    local c1 = _e4
    s1 = s1 .. c1
    i = i + 1
  end
  return(s1 .. "\"")
end
function string(x, depth, ancestors)
  if nil63(x) then
    return("nil")
  else
    if nan63(x) then
      return("nan")
    else
      if x == inf then
        return("inf")
      else
        if x == -inf then
          return("-inf")
        else
          if boolean63(x) then
            if x then
              return("true")
            else
              return("false")
            end
          else
            if string63(x) then
              return(escape(x))
            else
              if atom63(x) then
                return(tostring(x))
              else
                if function63(x) then
                  return("fn")
                else
                  if not obj63(x) then
                    return("|" .. type(x) .. "|")
                  else
                    local s = "("
                    local sp = ""
                    local xs = {}
                    local ks = {}
                    local d = (depth or 0) + 1
                    local ans = join({x}, ancestors or {})
                    if in63(x, ancestors or {}) then
                      return("circular")
                    end
                    local _o10 = x
                    local k = nil
                    for k in next, _o10 do
                      local v = _o10[k]
                      if number63(k) then
                        xs[k] = string(v, d, ans)
                      else
                        add(ks, k .. ":")
                        add(ks, string(v, d, ans))
                      end
                    end
                    local _o11 = join(xs, ks)
                    local _i13 = nil
                    for _i13 in next, _o11 do
                      local v = _o11[_i13]
                      s = s .. sp .. v
                      sp = " "
                    end
                    return(s .. ")")
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
local values = unpack or tunpack
function apply(f, args)
  local _args = stash(args)
  return(f(values(_args)))
end
function call(f)
  return(f())
end
function toplevel63()
  return(one63(environment))
end
function setenv(k, ...)
  local _r66 = unstash({...})
  local _id1 = _r66
  local _keys = cut(_id1, 0)
  if string63(k) then
    local _e7
    if _keys.toplevel then
      _e7 = hd(environment)
    else
      _e7 = last(environment)
    end
    local frame = _e7
    local entry = frame[k] or {}
    local _o12 = _keys
    local _k = nil
    for _k in next, _o12 do
      local v = _o12[_k]
      entry[_k] = v
    end
    frame[k] = entry
    return(frame[k])
  end
end
function _37message_handler(msg)
  local i = search(msg, ": ")
  return(clip(msg, i + 2))
end
local math = math
abs = math.abs
acos = math.acos
asin = math.asin
atan = math.atan
atan2 = math.atan2
ceil = math.ceil
cos = math.cos
floor = math.floor
log = math.log
log10 = math.log10
max = math.max
min = math.min
pow = math.pow
random = math.random
sin = math.sin
sinh = math.sinh
sqrt = math.sqrt
tan = math.tan
tanh = math.tanh
setenv("quote", {_stash = true, macro = function (form)
  return(quoted(form))
end})
setenv("quasiquote", {_stash = true, macro = function (form)
  return(quasiexpand(form, 1))
end})
setenv("at", {_stash = true, macro = function (l, i)
  if target == "lua" and number63(i) then
    i = i + 1
  else
    if target == "lua" then
      i = {"+", i, 1}
    end
  end
  return({"get", l, i})
end})
setenv("wipe", {_stash = true, macro = function (place)
  if target == "lua" then
    return({"set", place, "nil"})
  else
    return({"%delete", place})
  end
end})
setenv("list", {_stash = true, macro = function (...)
  local body = unstash({...})
  local x = unique("x")
  local l = {}
  local forms = {}
  local _o1 = body
  local k = nil
  for k in next, _o1 do
    local v = _o1[k]
    if number63(k) then
      l[k] = v
    else
      add(forms, {"set", {"get", x, {"quote", k}}, v})
    end
  end
  if some63(forms) then
    return(join({"let", x, join({"%array"}, l)}, forms, {x}))
  else
    return(join({"%array"}, l))
  end
end})
setenv("if", {_stash = true, macro = function (...)
  local branches = unstash({...})
  return(hd(expand_if(branches)))
end})
setenv("case", {_stash = true, macro = function (x, ...)
  local _r10 = unstash({...})
  local _id2 = _r10
  local clauses = cut(_id2, 0)
  local bs = map(function (_x34)
    local _id3 = _x34
    local a = _id3[1]
    local b = _id3[2]
    if nil63(b) then
      return({a})
    else
      return({{"=", {"quote", a}, x}, b})
    end
  end, pair(clauses))
  return(join({"if"}, apply(join, bs)))
end})
setenv("when", {_stash = true, macro = function (cond, ...)
  local _r13 = unstash({...})
  local _id5 = _r13
  local body = cut(_id5, 0)
  return({"if", cond, join({"do"}, body)})
end})
setenv("unless", {_stash = true, macro = function (cond, ...)
  local _r15 = unstash({...})
  local _id7 = _r15
  local body = cut(_id7, 0)
  return({"if", {"not", cond}, join({"do"}, body)})
end})
setenv("obj", {_stash = true, macro = function (...)
  local body = unstash({...})
  return(join({"%object"}, mapo(function (x)
    return(x)
  end, body)))
end})
setenv("let", {_stash = true, macro = function (bs, ...)
  local _r19 = unstash({...})
  local _id11 = _r19
  local body = cut(_id11, 0)
  if atom63(bs) then
    return(join({"let", {bs, hd(body)}}, tl(body)))
  else
    if none63(bs) then
      return(join({"do"}, body))
    else
      local _id12 = bs
      local lh = _id12[1]
      local rh = _id12[2]
      local bs2 = cut(_id12, 2)
      local _id13 = bind(lh, rh)
      local id = _id13[1]
      local val = _id13[2]
      local bs1 = cut(_id13, 2)
      local renames = {}
      if bound63(id) or reserved63(id) or toplevel63() then
        local id1 = unique(id)
        renames = {id, id1}
        id = id1
      else
        setenv(id, {_stash = true, variable = true})
      end
      return({"do", {"%local", id, val}, {"let-symbol", renames, join({"let", join(bs1, bs2)}, body)}})
    end
  end
end})
setenv("with", {_stash = true, macro = function (x, v, ...)
  local _r21 = unstash({...})
  local _id15 = _r21
  local body = cut(_id15, 0)
  return(join({"let", {x, v}}, body, {x}))
end})
setenv("let-when", {_stash = true, macro = function (x, v, ...)
  local _r23 = unstash({...})
  local _id17 = _r23
  local body = cut(_id17, 0)
  local y = unique("y")
  return({"let", y, v, {"when", y, join({"let", {x, y}}, body)}})
end})
setenv("define-macro", {_stash = true, macro = function (name, args, ...)
  local _r25 = unstash({...})
  local _id19 = _r25
  local body = cut(_id19, 0)
  local _x99 = {"setenv", {"quote", name}}
  _x99.macro = join({"fn", args}, body)
  local form = _x99
  eval(form)
  return(form)
end})
setenv("define-special", {_stash = true, macro = function (name, args, ...)
  local _r27 = unstash({...})
  local _id21 = _r27
  local body = cut(_id21, 0)
  local _x107 = {"setenv", {"quote", name}}
  _x107.special = join({"fn", args}, body)
  local form = join(_x107, keys(body))
  eval(form)
  return(form)
end})
setenv("define-symbol", {_stash = true, macro = function (name, expansion)
  setenv(name, {_stash = true, symbol = expansion})
  local _x113 = {"setenv", {"quote", name}}
  _x113.symbol = {"quote", expansion}
  return(_x113)
end})
setenv("define-reader", {_stash = true, macro = function (_x122, ...)
  local _id24 = _x122
  local char = _id24[1]
  local s = _id24[2]
  local _r31 = unstash({...})
  local _id25 = _r31
  local body = cut(_id25, 0)
  return({"set", {"get", "read-table", char}, join({"fn", {s}}, body)})
end})
setenv("define", {_stash = true, macro = function (name, x, ...)
  local _r33 = unstash({...})
  local _id27 = _r33
  local body = cut(_id27, 0)
  setenv(name, {_stash = true, variable = true})
  if some63(body) then
    return(join({"%local-function", name}, bind42(x, body)))
  else
    return({"%local", name, x})
  end
end})
setenv("define-global", {_stash = true, macro = function (name, x, ...)
  local _r35 = unstash({...})
  local _id29 = _r35
  local body = cut(_id29, 0)
  setenv(name, {_stash = true, toplevel = true, variable = true})
  if some63(body) then
    return(join({"%global-function", name}, bind42(x, body)))
  else
    return({"set", name, x})
  end
end})
setenv("with-frame", {_stash = true, macro = function (...)
  local body = unstash({...})
  local x = unique("x")
  return({"do", {"add", "environment", {"obj"}}, {"with", x, join({"do"}, body), {"drop", "environment"}}})
end})
setenv("with-bindings", {_stash = true, macro = function (_x159, ...)
  local _id32 = _x159
  local names = _id32[1]
  local _r37 = unstash({...})
  local _id33 = _r37
  local body = cut(_id33, 0)
  local x = unique("x")
  local _x163 = {"setenv", x}
  _x163.variable = true
  return(join({"with-frame", {"each", x, names, _x163}}, body))
end})
setenv("let-macro", {_stash = true, macro = function (definitions, ...)
  local _r40 = unstash({...})
  local _id35 = _r40
  local body = cut(_id35, 0)
  add(environment, {})
  map(function (m)
    return(macroexpand(join({"define-macro"}, m)))
  end, definitions)
  local _x169 = join({"do"}, macroexpand(body))
  drop(environment)
  return(_x169)
end})
setenv("let-symbol", {_stash = true, macro = function (expansions, ...)
  local _r44 = unstash({...})
  local _id38 = _r44
  local body = cut(_id38, 0)
  add(environment, {})
  map(function (_x179)
    local _id39 = _x179
    local name = _id39[1]
    local exp = _id39[2]
    return(macroexpand({"define-symbol", name, exp}))
  end, pair(expansions))
  local _x178 = join({"do"}, macroexpand(body))
  drop(environment)
  return(_x178)
end})
setenv("let-unique", {_stash = true, macro = function (names, ...)
  local _r48 = unstash({...})
  local _id41 = _r48
  local body = cut(_id41, 0)
  local bs = map(function (n)
    return({n, {"unique", {"quote", n}}})
  end, names)
  return(join({"let", apply(join, bs)}, body))
end})
setenv("fn", {_stash = true, macro = function (args, ...)
  local _r51 = unstash({...})
  local _id43 = _r51
  local body = cut(_id43, 0)
  return(join({"%function"}, bind42(args, body)))
end})
setenv("guard", {_stash = true, macro = function (expr)
  if target == "js" then
    return({{"fn", join(), {"%try", {"list", true, expr}}}})
  else
    local e = unique("e")
    local x = unique("x")
    local msg = unique("msg")
    return({"let", {x, "nil", msg, "nil", e, {"xpcall", {"fn", join(), {"set", x, expr}}, {"fn", {"m"}, {"set", msg, {"%message-handler", "m"}}}}}, {"list", e, {"if", e, x, msg}}})
  end
end})
setenv("each", {_stash = true, macro = function (x, t, ...)
  local _r55 = unstash({...})
  local _id46 = _r55
  local body = cut(_id46, 0)
  local o = unique("o")
  local n = unique("n")
  local i = unique("i")
  local _e3
  if atom63(x) then
    _e3 = {i, x}
  else
    local _e4
    if _35(x) > 1 then
      _e4 = x
    else
      _e4 = {i, hd(x)}
    end
    _e3 = _e4
  end
  local _id47 = _e3
  local k = _id47[1]
  local v = _id47[2]
  local _e5
  if target == "lua" then
    _e5 = body
  else
    _e5 = {join({"let", k, {"if", {"numeric?", k}, {"parseInt", k}, k}}, body)}
  end
  return({"let", {o, t, k, "nil"}, {"%for", o, k, join({"let", {v, {"get", o, k}}}, _e5)}})
end})
setenv("for", {_stash = true, macro = function (i, to, ...)
  local _r57 = unstash({...})
  local _id49 = _r57
  local body = cut(_id49, 0)
  return({"let", i, 0, join({"while", {"<", i, to}}, body, {{"inc", i}})})
end})
setenv("step", {_stash = true, macro = function (v, t, ...)
  local _r59 = unstash({...})
  local _id51 = _r59
  local body = cut(_id51, 0)
  local x = unique("x")
  local n = unique("n")
  local i = unique("i")
  return({"let", {x, t, n, {"#", x}}, {"for", i, n, join({"let", {v, {"at", x, i}}}, body)}})
end})
setenv("set-of", {_stash = true, macro = function (...)
  local xs = unstash({...})
  local l = {}
  local _o3 = xs
  local _i3 = nil
  for _i3 in next, _o3 do
    local x = _o3[_i3]
    l[x] = true
  end
  return(join({"obj"}, l))
end})
setenv("language", {_stash = true, macro = function ()
  return({"quote", target})
end})
setenv("target", {_stash = true, macro = function (...)
  local clauses = unstash({...})
  return(clauses[target])
end})
setenv("join!", {_stash = true, macro = function (a, ...)
  local _r63 = unstash({...})
  local _id53 = _r63
  local bs = cut(_id53, 0)
  return({"set", a, join({"join", a}, bs)})
end})
setenv("cat!", {_stash = true, macro = function (a, ...)
  local _r65 = unstash({...})
  local _id55 = _r65
  local bs = cut(_id55, 0)
  return({"set", a, join({"cat", a}, bs)})
end})
setenv("inc", {_stash = true, macro = function (n, by)
  return({"set", n, {"+", n, by or 1}})
end})
setenv("dec", {_stash = true, macro = function (n, by)
  return({"set", n, {"-", n, by or 1}})
end})
setenv("with-indent", {_stash = true, macro = function (form)
  local x = unique("x")
  return({"do", {"inc", "indent-level"}, {"with", x, form, {"dec", "indent-level"}}})
end})
setenv("export", {_stash = true, macro = function (...)
  local names = unstash({...})
  if target == "js" then
    return(join({"do"}, map(function (k)
      return({"set", {"get", "exports", {"quote", k}}, k})
    end, names)))
  else
    local x = {}
    local _o5 = names
    local _i5 = nil
    for _i5 in next, _o5 do
      local k = _o5[_i5]
      x[k] = k
    end
    return({"return", join({"obj"}, x)})
  end
end})
local reader = require("reader")
local compiler = require("compiler")
local system = require("system")
function eval_print(form)
  local _x = nil
  local _msg = nil
  local _e = xpcall(function ()
    _x = compiler.eval(form)
    return(_x)
  end, function (m)
    _msg = _37message_handler(m)
    return(_msg)
  end)
  local _e1
  if _e then
    _e1 = _x
  else
    _e1 = _msg
  end
  local _id = {_e, _e1}
  local ok = _id[1]
  local x = _id[2]
  if not ok then
    return(print("error: " .. x))
  else
    if is63(x) then
      return(print(string(x)))
    end
  end
end
local function rep(s)
  return(eval_print(reader["read-string"](s)))
end
function repl()
  local buf = ""
  local function rep1(s)
    buf = buf .. s
    local more = {}
    local form = reader["read-string"](buf, more)
    if not( form == more) then
      eval_print(form)
      buf = ""
      return(system.write("> "))
    end
  end
  system.write("> ")
  while true do
    local s = io.read()
    if s then
      rep1(s .. "\n")
    else
      break
    end
  end
end
function compile_file(path)
  local s = reader.stream(system["read-file"](path))
  local body = reader["read-all"](s)
  local form = compiler.expand(join({"do"}, body))
  return(compiler.compile(form, {_stash = true, stmt = true}))
end
function load(path)
  return(compiler.run(compile_file(path)))
end
local function run_file(path)
  return(compiler.run(system["read-file"](path)))
end
local function usage()
  print("usage: lumen [options] <object files>")
  print("options:")
  print("  -c <input>\tCompile input file")
  print("  -o <output>\tOutput file")
  print("  -t <target>\tTarget language (default: lua)")
  print("  -e <expr>\tExpression to evaluate")
  return(system.exit())
end
local function main()
  local arg = hd(system.argv)
  if arg == "-h" or arg == "--help" then
    usage()
  end
  local pre = {}
  local input = nil
  local output = nil
  local target1 = nil
  local expr = nil
  local argv = system.argv
  local n = _35(argv)
  local i = 0
  while i < n do
    local a = argv[i + 1]
    if a == "-c" or a == "-o" or a == "-t" or a == "-e" then
      if i == n - 1 then
        print("missing argument for " .. a)
      else
        i = i + 1
        local val = argv[i + 1]
        if a == "-c" then
          input = val
        else
          if a == "-o" then
            output = val
          else
            if a == "-t" then
              target1 = val
            else
              if a == "-e" then
                expr = val
              end
            end
          end
        end
      end
    else
      if not( "-" == char(a, 0)) then
        add(pre, a)
      end
    end
    i = i + 1
  end
  local _x3 = pre
  local _n = _35(_x3)
  local _i = 0
  while _i < _n do
    local file = _x3[_i + 1]
    run_file(file)
    _i = _i + 1
  end
  if nil63(input) then
    if expr then
      return(rep(expr))
    else
      return(repl())
    end
  else
    if target1 then
      target = target1
    end
    local code = compile_file(input)
    if nil63(output) or output == "-" then
      return(print(code))
    else
      return(system["write-file"](output, code))
    end
  end
end
setenv("define", {_stash = true, macro = function (...)
  local l = unstash({...})
  return(join({"define-global"}, l))
end})
function comp(expr)
  return(print(compile(macroexpand(expr))))
end
reader = require("reader")
reader_stream = reader.stream
read_all = reader["read-all"]
system = require("system")
write = system.write
read_file = system["read-file"]
write_file = system["write-file"]
env = system["get-environment-variable"]
function readstr(s)
  return(read_all(reader_stream(s)))
end
function load(file, ...)
  local _r2 = unstash({...})
  local _id = _r2
  local verbose = _id.verbose
  if verbose then
    print("Loading " .. file)
  end
  local _x5 = readstr(read_file(file))
  local _n = _35(_x5)
  local _i = 0
  while _i < _n do
    local expr = _x5[_i + 1]
    if "1" == env("VERBOSE") then
      prn(string(expr))
    end
    if "1" == env("COMP") then
      prn(comp(expr))
    end
    local _x6 = nil
    local _msg = nil
    local _e = xpcall(function ()
      _x6 = eval(expr)
      return(_x6)
    end, function (m)
      _msg = _37message_handler(m)
      return(_msg)
    end)
    local _e5
    if _e then
      _e5 = _x6
    else
      _e5 = _msg
    end
    local _id1 = {_e, _e5}
    local ok = _id1[1]
    local x = _id1[2]
    if not ok then
      prn("Error in ", file, ": ")
      prn("   ", x)
      prn("The error occurred while evaluating: ")
      prn(expr)
    end
    _i = _i + 1
  end
end
setenv("mac", {_stash = true, macro = function (...)
  local l = unstash({...})
  return(join({"define-macro"}, l))
end})
setenv("macex", {_stash = true, macro = function (e)
  return({"macroexpand", e})
end})
setenv("len", {_stash = true, macro = function (...)
  local l = unstash({...})
  return(join({"#"}, l))
end})
setenv("letmac", {_stash = true, macro = function (name, args, body, ...)
  local _r8 = unstash({...})
  local _id3 = _r8
  local l = cut(_id3, 0)
  return(join({"let-macro", {{name, args, body}}}, l))
end})
setenv("def", {_stash = true, macro = function (...)
  local l = unstash({...})
  return(join({"define-global"}, l))
end})
idfn = function (x)
  return(x)
end
setenv("w/uniq", {_stash = true, macro = function (x, ...)
  local _r11 = unstash({...})
  local _id5 = _r11
  local body = cut(_id5, 0)
  if atom63(x) then
    return(join({"let-unique", {x}}, body))
  else
    return(join({"let-unique", x}, body))
  end
end})
setenv("void", {_stash = true, macro = function (...)
  local l = unstash({...})
  return(join({"do"}, l, {"nil"}))
end})
setenv("lfn", {_stash = true, macro = function (name, args, body, ...)
  local _r13 = unstash({...})
  local _id7 = _r13
  local l = cut(_id7, 0)
  local _e6
  if some63(l) then
    _e6 = l
  else
    _e6 = {name}
  end
  return(join({"let", name, "nil", {"set", name, {"fn", args, body}}}, _e6))
end})
setenv("afn", {_stash = true, macro = function (args, body, ...)
  local _r15 = unstash({...})
  local _id9 = _r15
  local l = cut(_id9, 0)
  return(join({"lfn", "self", args, body}, l))
end})
setenv("accum", {_stash = true, macro = function (name, ...)
  local _r17 = unstash({...})
  local _id11 = _r17
  local body = cut(_id11, 0)
  local g = unique("g")
  return({"let", g, join(), join({"lfn", name, {"item"}, {"add", g, "item"}}, body), g})
end})
setenv("acc", {_stash = true, macro = function (...)
  local l = unstash({...})
  return(join({"accum", "a"}, l))
end})
setenv("nor", {_stash = true, macro = function (...)
  local l = unstash({...})
  return({"not", join({"or"}, l)})
end})
function lst63(x)
  return(not( atom63(x) or function63(x)))
end
function any63(x)
  return(lst63(x) and some63(x))
end
setenv("iflet", {_stash = true, macro = function (name, ...)
  local _r21 = unstash({...})
  local _id14 = _r21
  local l = cut(_id14, 0)
  if some63(l) then
    local _id15 = l
    local x = _id15[1]
    local a = _id15[2]
    local bs = cut(_id15, 2)
    local _e7
    if one63(l) then
      _e7 = name
    else
      _e7 = {"if", name, a, join({"iflet", name}, bs)}
    end
    return({"let", name, x, _e7})
  end
end})
setenv("whenlet", {_stash = true, macro = function (name, ...)
  local _r23 = unstash({...})
  local _id18 = _r23
  local l = cut(_id18, 0)
  if some63(l) then
    local _id19 = l
    local x = _id19[1]
    local ys = cut(_id19, 1)
    local _e8
    if one63(l) then
      _e8 = name
    else
      _e8 = join({"do"}, ys)
    end
    return({"let", name, x, _e8})
  end
end})
setenv("aif", {_stash = true, macro = function (...)
  local l = unstash({...})
  return(join({"iflet", "it"}, l))
end})
setenv("awhen", {_stash = true, macro = function (...)
  local l = unstash({...})
  return(join({"let-when", "it"}, l))
end})
setenv("repeat", {_stash = true, macro = function (n, ...)
  local _r25 = unstash({...})
  local _id21 = _r25
  local l = cut(_id21, 0)
  local g = unique("g")
  return(join({"for", g, n}, l))
end})
function atom(x)
  return(atom63(x) or function63(x))
end
function acons(x)
  return(not atom(x))
end
function car(x)
  if acons(x) and some63(x) then
    return(hd(x))
  end
end
function cdr(x)
  if acons(x) and some63(x) then
    return(tl(x))
  end
end
function caar(x)
  return(car(car(x)))
end
function cadr(x)
  return(car(cdr(x)))
end
function cddr(x)
  return(cdr(cdr(x)))
end
function cons(x, y)
  return(join({x}, y))
end
function copylist(xs)
  local l = {}
  local _o = xs
  local k = nil
  for k in next, _o do
    local v = _o[k]
    l[k] = v
  end
  return(l)
end
function listify(x)
  if atom63(x) then
    return({x})
  else
    return(x)
  end
end
function intersperse(x, lst)
  local sep = nil
  local _g = {}
  local a = nil
  a = function (item)
    return(add(_g, item))
  end
  local _o1 = lst
  local _i2 = nil
  for _i2 in next, _o1 do
    local item = _o1[_i2]
    if sep then
      a(sep)
    else
      sep = x
    end
    a(item)
  end
  return(_g)
end
setenv("complement", {_stash = true, macro = function (f)
  local g = unique("g")
  return({"fn", g, {"not", {"apply", f, g}}})
end})
function testify(x)
  if function63(x) then
    return(x)
  else
    return(function (_)
      return(_ == x)
    end)
  end
end
function keep(f, xs)
  f = testify(f)
  local _g1 = {}
  local a = nil
  a = function (item)
    return(add(_g1, item))
  end
  local _x112 = xs
  local _n3 = _35(_x112)
  local _i3 = 0
  while _i3 < _n3 do
    local x = _x112[_i3 + 1]
    if f(x) then
      a(x)
    end
    _i3 = _i3 + 1
  end
  return(_g1)
end
function rem(f, xs)
  return(keep(function (...)
    local _g2 = unstash({...})
    return(not apply(testify(f), _g2))
  end, xs))
end
rev = reverse
function str(x)
  if string63(x) then
    return(x)
  else
    return(string(x))
  end
end
wschars = {" ", "\t", "\n", "\r"}
function ws63(s)
  local i = 0
  while i < _35(s) do
    local c = char(s, i)
    if in63(c, wschars) then
      return(true)
    end
    i = i + 1
  end
end
function rtrim(s, ...)
  local _r47 = unstash({...})
  local _id22 = _r47
  local f = _id22.f
  while some63(s) and (f or ws63)(char(s, edge(s))) do
    s = clip(s, 0, edge(s))
  end
  return(s)
end
function ltrim(s, ...)
  local _r48 = unstash({...})
  local _id23 = _r48
  local f = _id23.f
  while some63(s) and (f or ws63)(char(s, 0)) do
    s = clip(s, 1, _35(s))
  end
  return(s)
end
function trim(s, ...)
  local _r49 = unstash({...})
  local _id24 = _r49
  local f = _id24.f
  return(rtrim(ltrim(s, {_stash = true, f = f}), {_stash = true, f = f}))
end
function endswith(s, ending)
  local i = _35(s) - _35(ending)
  return(i == search(s, ending, i))
end
function startswith(s, prefix)
  return(search(s, prefix) == 0)
end
function pr(...)
  local _r52 = unstash({...})
  local _id25 = _r52
  local sep = _id25.sep
  local l = cut(_id25, 0)
  local c = nil
  if sep then
    local _x119 = l
    local _n4 = _35(_x119)
    local _i4 = 0
    while _i4 < _n4 do
      local x = _x119[_i4 + 1]
      if c then
        write(c)
      else
        c = str(sep)
      end
      write(str(x))
      _i4 = _i4 + 1
    end
  else
    local _x120 = l
    local _n5 = _35(_x120)
    local _i5 = 0
    while _i5 < _n5 do
      local x = _x120[_i5 + 1]
      write(str(x))
      _i5 = _i5 + 1
    end
  end
  if l then
    return(hd(l))
  end
end
setenv("do1", {_stash = true, macro = function (a, ...)
  local _r54 = unstash({...})
  local _id27 = _r54
  local bs = cut(_id27, 0)
  local g = unique("g")
  return({"let", g, a, join({"do"}, bs), g})
end})
function prn(...)
  local l = unstash({...})
  local _g3 = apply(pr, l)
  pr("\n")
  return(_g3)
end
function filechars(path)
  return(read_file(path))
end
function readfile(path)
  return(readstr(filechars(path)))
end
function doshell(...)
  local args = unstash({...})
  return(rtrim(shell(apply(cat, intersperse(" ", args)))))
end
function mvfile(src, dst)
  doshell("mv", escape(src), escape(dst))
  return(dst)
end
function getmod(file)
  return(doshell("stat -r", escape(file), "| awk '{ print $3; }'"))
end
function chmod(spec, file)
  return(doshell("chmod", escape(spec), escape(file)))
end
function chmodx(file)
  return(chmod("+x", file))
end
function writefile(path, contents)
  doshell("cp -fp", escape(path), escape(path .. ".tmp"))
  write_file(path .. ".tmp", contents)
  mvfile(path .. ".tmp", path)
  return(contents)
end
setenv("w/file", {_stash = true, macro = function (v, path, ...)
  local _r63 = unstash({...})
  local _id29 = _r63
  local l = cut(_id29, 0)
  local gp = unique("gp")
  return({"let", {gp, path, v, {"filechars", gp}}, {"set", v, join({"do"}, l)}, {"writefile", gp, v}})
end})
function args()
  return(split(env("cmdline"), " "))
end
function host()
  return(env("LUMEN_HOST") or "")
end
function host63(x)
  return(search(host(), x))
end
setenv("import", {_stash = true, macro = function (name)
  return({"def", name, {"require", {"quote", name}}})
end})
if host63("luajit") then
  ffi = require("ffi")
  setenv("defc", {_stash = true, macro = function (name, val)
    local _e9
    if id_literal63(val) then
      _e9 = inner(val)
    else
      _e9 = val
    end
    return({"do", {{"get", "ffi", {"quote", "cdef"}}, {"quote", _e9}}, {"def", name, {"get", {"get", "ffi", {"quote", "C"}}, {"quote", name}}}})
  end})
  ffi.cdef("int usleep (unsigned int usecs)")
  usleep = ffi.C.usleep
  function sleep(secs)
    usleep(secs * 1000000)
    return(nil)
  end
end
function shell(cmd)
  function exec(s)
    local h = io.popen(cmd)
    local _g4 = h.read(h, "*a")
    h.close(h)
    return(_g4)
  end
  return(exec(cmd))
end
local _sys = require("system")
pj = _sys["path-join"]
sep = _sys["path-separator"]
file63 = _sys["file-exists?"]
function fixpath(path)
  local s = sep .. "." .. sep
  while search(path, s) do
    path = replace(path, s, sep)
  end
  if 0 == search(path, "." .. sep) then
    path = replace(path, "." .. sep, "", 1)
  end
  return(path)
end
function j(...)
  local parts = unstash({...})
  return(fixpath(apply(pj, parts)))
end
function dir63(path)
  return("1" == _36("sh", "-c", "if [ -d " .. escape(path) .. " ]; then echo 1; fi", {_stash = true, hush = true}))
end
function exists63(path)
  return(dir63(path) or file63(path))
end
function dirname(file)
  return(_36("dirname", file, {_stash = true, hush = true}))
end
function basename(file)
  return(_36("basename", file, {_stash = true, hush = true}))
end
function realpath(path)
  if dir63(path) then
    return(_36("cd", path, ";", "pwd"))
  else
    return(j(_36("cd", dirname(path), ";", "pwd"), basename(path)))
  end
end
function rmrf(path)
  if 0 == search(path, "/") then
    error("Cowardly refusing to rm -rf an absolute path: " .. path)
  end
  if dir63(path) or file63(path) then
    return(_36("rm", "-rf", path))
  end
end
function surround(x, ...)
  local _r7 = unstash({...})
  local _id = _r7
  local lh = _id.lh
  local rh = _id.rh
  return((lh or "") .. x .. (rh or ""))
end
function q(x)
  if ws63(x) then
    return(surround(x, {_stash = true, lh = "\'", rh = "\'"}))
  else
    return(x)
  end
end
function docmd(cmdline)
  return(shell(cmdline))
end
cwd = "."
function getcwd()
  return(cwd)
end
pushds = {}
function pushd(path)
  add(pushds, pwd())
  return(cd(path))
end
function popd()
  if none63(pushds) then
    error("popd: directory stack empty")
  end
  local i = edge(pushds)
  cd(pushds[i + 1])
  pushds = cut(pushds, 0, i)
  return(pwd())
end
function cd(path)
  if path then
    cwd = _36("cd", path, ";", "pwd", {_stash = true, hush = true})
  else
    cwd = "."
  end
  return(pwd())
end
cd1 = cd
setenv("cd", {_stash = true, macro = function (path, ...)
  local _r15 = unstash({...})
  local _id2 = _r15
  local l = cut(_id2, 0)
  if none63(l) then
    return({"cd1", path})
  else
    return({"do", {"pushd", path}, {"do1", join({"do"}, l), {"popd"}}})
  end
end})
function resetcwd()
  cwd = "."
  pushds = {}
  return(pushds)
end
function pwd()
  return(_36("pwd", {_stash = true, hush = true}))
end
function mkdir(path)
  return(_36("mkdir", "-p", path))
end
setenv("w/mkdir", {_stash = true, macro = function (path, ...)
  local _r20 = unstash({...})
  local _id4 = _r20
  local body = cut(_id4, 0)
  local g = unique("g")
  return({"let", g, path, {"mkdir", g}, {"pushd", g}, {"do1", join({"do"}, body), {"popd"}}})
end})
function tree(path, pattern)
  if not dir63(path) then
    error("tree: not a dir: " .. path)
  end
  pushd(path)
  local _e1
  if pattern then
    _e1 = _36("find", ".", "|", "grep", "-v", "'/\\.monki/'", "|", "grep", pattern, "|", "cat")
  else
    _e1 = _36("find", ".", "|", "grep", "-v", "'/\\.monki/'", "|", "cat")
  end
  local s = trim(_e1)
  local _e2
  if s and some63(s) then
    _e2 = map(fixpath, split(s, "\n"))
  else
    _e2 = {}
  end
  local _g = _e2
  popd()
  return(_g)
end
function which(prog)
  local _x31 = nil
  local _msg = nil
  local _e = xpcall(function ()
    _x31 = _36("which", prog)
    return(_x31)
  end, function (m)
    _msg = _37message_handler(m)
    return(_msg)
  end)
  local _e3
  if _e then
    _e3 = _x31
  else
    _e3 = _msg
  end
  local _id5 = {_e, _e3}
  local ok = _id5[1]
  local x = _id5[2]
  if ok then
    return(x)
  end
end
function freebsd63()
  return(_36("uname") == "FreeBSD")
end
function make(...)
  local args = unstash({...})
  local _e4
  if freebsd63() then
    local _e5
    if which("gmake") then
      _e5 = "gmake"
    else
      error("Install gmake by running:  sudo pkg install gmake")
      _e5 = nil
    end
    _e4 = _e5
  else
    _e4 = "make"
  end
  local prog = _e4
  return(prn(apply(_36, join({"time", prog}, args))))
end
function clean()
  return(make("clean"))
end
function build()
  return(make("--always-make", "all"))
end
function test()
  return(make("--always-make", "test"))
end
function rebuild(count)
  clean()
  local _g1 = 0
  while _g1 < (count or 1) do
    build()
    _g1 = _g1 + 1
  end
end
function unlit(x)
  if id_literal63(x) then
    return(inner(x))
  else
    return(x)
  end
end
setenv("unlit!", {_stash = true, macro = function (...)
  local xs = unstash({...})
  return(join({"do"}, map(function (_)
    return({"set", _, {"unlit", _}})
  end, xs)))
end})
function tolit(x)
  if not atom63(x) then
    return(x)
  else
    if id_literal63(x) then
      return({"quote", inner(x)})
    else
      if string63(x) then
        return(x)
      else
        return({"quote", x})
      end
    end
  end
end
function replace(str, x, y, count)
  local self = nil
  self = function (str, x, y, count)
    if count and count == 0 then
      return(str)
    end
    local pos = search(str, x)
    if pos then
      return(clip(str, 0, pos) .. y .. self(clip(str, pos + _35(x)), x, y, count and count - 1))
    else
      local _pos = str
      return(_pos)
    end
  end
  return(self(unlit(str), unlit(x), unlit(y), count))
end
function patch(file, x, y)
  file = unlit(file)
  x = unlit(x)
  y = unlit(y)
  local _gp = j(getcwd(), file)
  local fs = filechars(_gp)
  local _e6
  if not search(fs, x) then
    error(file .. ": patch: failed to find code:\n  " .. x)
    _e6 = nil
  end
  fs = replace(fs, x, y)
  return(writefile(_gp, fs))
end
setenv("patch", {_stash = true, macro = function (...)
  local args = unstash({...})
  return(join({"patch1"}, map(tolit, args)))
end})
patch1 = patch
setenv("create", {_stash = true, macro = function (file, x)
  local g = unique("g")
  return({"let", g, {"j", {"getcwd"}, file}, {"touch", g}, {"w/file", g, {"j", {"getcwd"}, file}, x}})
end})
function touch(files)
  return(apply(_36, join({"touch"}, listify(files))))
end
function make_global(file, ...)
  local _r40 = unstash({...})
  local _id6 = _r40
  local variables = cut(_id6, 0)
  local _x65 = variables
  local _n = _35(_x65)
  local _i = 0
  while _i < _n do
    local v = _x65[_i + 1]
    patch1(file, "(define " .. v .. " ", "(define-global " .. v .. " ")
    _i = _i + 1
  end
end
function _36(...)
  local args = unstash({...})
  local hush = args.hush
  local c = ""
  local cmds = {}
  local _x67 = args
  local _n1 = _35(_x67)
  local _i1 = 0
  while _i1 < _n1 do
    local arg = _x67[_i1 + 1]
    if arg == ";" then
      add(cmds, c)
      c = ""
    else
      if c == "" then
        c = c .. arg
        c = c .. " "
      else
        c = c .. q(arg)
        c = c .. " "
      end
    end
    _i1 = _i1 + 1
  end
  if some63(c) then
    add(cmds, c)
  end
  local cmdline = apply(cat, intersperse("; ", cmds))
  if not( cwd == ".") then
    cmdline = "cd " .. q(cwd) .. "; " .. cmdline
  end
  if not hush or env("VERBOSE") then
    prn(cmdline)
  end
  return(rtrim(docmd(cmdline)))
end
function git63(path)
  return(dir63(j(path, ".git")))
end
function git(path, what, ...)
  local _r42 = unstash({...})
  local _id7 = _r42
  local args = cut(_id7, 0)
  if not( what == "clone") then
    if not git63(path) then
      error("no .git at " .. path)
    end
  end
  local _x69 = {"git", "--git-dir=" .. q(j(path, ".git")), what}
  _x69.hush = true
  return(apply(_36, join(_x69, args)))
end
function gitdir(path, nocheck)
  local _e7
  if path then
    _e7 = j(path, ".monki", "git")
  else
    _e7 = j(".monki", "git")
  end
  local dst = _e7
  if not nocheck then
    if not git63(dst) then
      local errmsg = "Error: no .git at " .. dst
      prn(errmsg)
    end
  end
  return(dst)
end
function giturl(dst)
  if git63(dst) then
    return(trim(_36("cat", j(dst, ".git", "config"), "|", "grep", "-o", "url.*=.*", "|", "cut", "-d'='", "-f2-")))
  end
end
function repo_changed63(dst, repo)
  local url = giturl(dst)
  if url then
    return(not( url == repo))
  end
end
function clone(repo, revision)
  if not repo or none63(repo) then
    error("fetch: bad repo")
  end
  if not( "." == char(repo, 0) or search(repo, "://")) then
    repo = "https://github.com/" .. repo
  end
  mkdir(gitdir(".", true))
  _36("echo", "'*'", ">", j(".monki", ".gitignore"))
  local dst = gitdir(".", true)
  if repo_changed63(dst, repo) then
    rmrf(dst)
  end
  if not git63(dst) then
    _36("git", "clone", "-n", repo, dst)
  end
  if not git63(dst) then
    error("could not clone " .. repo .. " to " .. dst)
  end
  git(dst, "reset", "--", ".")
  git(dst, "checkout", "--", ".")
  git(dst, "checkout", "master")
  git(dst, "pull")
  if revision then
    return(git(dst, "checkout", revision))
  end
end
function monki(path)
  local dir = dirname(path)
  local file = basename(path)
  pushd(dir)
  _36("mkdir", "-p", j(".monki", "tmp"))
  _36("cp", file, j(".monki", "tmp"))
  local _g3 = load(realpath(file), {_stash = true, verbose = true})
  _36("cp", j(".monki", "tmp", file), file)
  _36("rm", j(".monki", "tmp", file))
  local _g2 = _g3
  popd()
  return(_g2)
end
function monkitree(path)
  pushd(path)
  local _o = tree(".", "/monki.l$")
  local _i2 = nil
  for _i2 in next, _o do
    local file = _o[_i2]
    prn(j(pwd(), path, file))
    monki(file)
  end
  local _g4
  popd()
  return(_g4)
end
function musage()
  prn("  to run all monki.l files beneath a dir:")
  prn("    monki <dir>")
  prn("  to clone a git repo at a subdir:")
  prn("    monki clone <url> [revision] <subdir>")
  prn("")
  return(prn(" e.g.  monki clone laarc/monki monki"))
end
function mmain(argv)
  if none63(argv or {}) then
    return(monkitree(pwd()))
  end
  local op = argv[1]
  local params = cut(argv, 1)
  if in63(op, {"-h", "--help", "help"}) then
    musage()
    return
  end
  if endswith(op, ".l") then
    return(monki(op))
  end
  if op == "repl" then
    return
  end
  if op == "clone" then
    if not( _35(argv) > 1) then
      musage()
      return
    end
    local dst = argv[edge(argv) + 1]
    if dir63(dst) then
      error("monki clone: already exists: " .. dst)
    end
    mkdir(dst)
    _36("echo", "(clone " .. inner(string(cut(params, 0, edge(params)))) .. ")", ">", j(dst, "monki.l"))
    return(monkitree(dst))
  end
  if op == "git" then
    prn(apply(git, join({gitdir(pwd())}, params or {})))
    return
  end
  local _x72 = argv
  local _n3 = _35(_x72)
  local _i3 = 0
  while _i3 < _n3 do
    local arg = _x72[_i3 + 1]
    if dir63(arg) then
      monkitree(arg)
    else
      if endswith(arg, ".l") then
        monki(arg)
      else
        error("unknown cmd " .. arg)
      end
    end
    _i3 = _i3 + 1
  end
end
mmain(args())
main()
