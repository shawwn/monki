environment = {{}}
target = "lua"
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
  return(nil63(x) or string63(x) or number63(x) or boolean63(x) or function63(x))
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
  return(string.sub(s, from + 1, upto))
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
  return(string.byte(s, _e2))
end
function string_literal63(x)
  return(string63(x) and char(x, 0) == "\"")
end
function id_literal63(x)
  return(string63(x) and char(x, 0) == "|")
end
function add(l, x)
  return(table.insert(l, x))
end
function drop(l)
  return(table.remove(l))
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
function tuple(lst, n)
  if nil63(n) then
    n = 2
  end
  local l1 = {}
  local i = 0
  while i < _35(lst) do
    local l2 = {}
    local j = 0
    while j < n do
      add(l2, lst[i + j + 1])
      j = j + 1
    end
    add(l1, l2)
    i = i + (n - 1)
    i = i + 1
  end
  return(l1)
end
function vals(lst)
  local r = {}
  local _x4 = lst
  local _n6 = _35(_x4)
  local _i6 = 0
  while _i6 < _n6 do
    local x = _x4[_i6 + 1]
    add(r, x)
    _i6 = _i6 + 1
  end
  return(r)
end
function sort(l, f)
  table.sort(l, f)
  return(l)
end
function map(f, x)
  local t = {}
  local _x5 = x
  local _n7 = _35(_x5)
  local _i7 = 0
  while _i7 < _n7 do
    local v = _x5[_i7 + 1]
    local y = f(v)
    if is63(y) then
      add(t, y)
    end
    _i7 = _i7 + 1
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
  local _i10 = nil
  for _i10 in next, _o7 do
    local x = _o7[_i10]
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
  local i = string.find(s, pattern, _start, true)
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
function str(x, depth, ancestors)
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
                        xs[k] = str(v, d, ans)
                      else
                        add(ks, k .. ":")
                        add(ks, str(v, d, ans))
                      end
                    end
                    local _o11 = join(xs, ks)
                    local _i14 = nil
                    for _i14 in next, _o11 do
                      local v = _o11[_i14]
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
local values = unpack or table.unpack
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
  local _r68 = unstash({...})
  local _id1 = _r68
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
      if bound63(id) or toplevel63() then
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
    local x = unique("x")
    local msg = unique("msg")
    local trace = unique("trace")
    return({"let", {x, "nil", msg, "nil", trace, "nil"}, {"if", {"xpcall", {"fn", join(), {"set", x, expr}}, {"fn", {"m"}, {"set", msg, {"clip", "m", {"+", {"search", "m", "\": \""}, 2}}}, {"set", trace, {{"get", "debug", {"quote", "traceback"}}}}}}, {"list", true, x}, {"list", false, msg, trace}}})
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
function pretty_print(x)
  return(print(str(x)))
end
local __x = nil
local _msg = nil
local _trace = nil
local _e
if xpcall(function ()
  __x = require("require")
  return(__x)
end, function (m)
  _msg = clip(m, search(m, ": ") + 2)
  _trace = debug.traceback()
  return(_trace)
end) then
  _e = {true, __x}
else
  _e = {false, _msg, _trace}
end
local __id = _e
local ok = __id[1]
local req = __id[2]
if ok then
  require = req("/")
  eval({"define-global", "require", {{"require", {"quote", "require"}}, "\"/\""}})
  pretty_print = require("pretty-print").prettyPrint
  compiler.run("\nffi = require('ffi')\nffi.cdef[[int fcntl(int fildes, int cmd, ...);]]\nffi.cdef[[static const int F_GETFL= 3;/* get file status flags */]]\nffi.cdef[[static const int F_SETFL= 4;/* set file status flags */]]\nffi.cdef[[static const int O_NONBLOCK	= 0x0004;		/* no delay */]]\nlocal flags = ffi.C.fcntl(0, ffi.C.F_GETFL, 0)\nbit = require(\"bit\")\nflags = bit.bxor(flags, ffi.C.O_NONBLOCK)\nffi.C.fcntl(0, ffi.C.F_SETFL, flags)\n")
end
function eval_print(form)
  local _x7 = nil
  local _msg1 = nil
  local _trace1 = nil
  local _e1
  if xpcall(function ()
    _x7 = compiler.eval(form)
    return(_x7)
  end, function (m)
    _msg1 = clip(m, search(m, ": ") + 2)
    _trace1 = debug.traceback()
    return(_trace1)
  end) then
    _e1 = {true, _x7}
  else
    _e1 = {false, _msg1, _trace1}
  end
  local _id1 = _e1
  local ok = _id1[1]
  local x = _id1[2]
  local trace = _id1[3]
  if not ok then
    return(print("error: " .. x .. "\n" .. trace))
  else
    if is63(x) then
      return(pretty_print(x))
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
  local _x11 = pre
  local _n = _35(_x11)
  local _i = 0
  while _i < _n do
    local file = _x11[_i + 1]
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
setenv("void", {_stash = true, macro = function (...)
  local l = unstash({...})
  return(join({"do"}, l, {"nil"}))
end})
setenv("alias", {_stash = true, macro = function (newname, oldname)
  return({"define-macro", newname, "l", {"quasiquote", {{"unquote", {"quote", oldname}}, {"unquote-splicing", "l"}}}})
end})
setenv("var", {_stash = true, macro = function (...)
  local l = unstash({...})
  return(join({"define"}, l))
end})
setenv("def", {_stash = true, macro = function (...)
  local l = unstash({...})
  return(join({"define-global"}, l))
end})
setenv("sym", {_stash = true, macro = function (...)
  local l = unstash({...})
  return(join({"define-symbol"}, l))
end})
setenv("mac", {_stash = true, macro = function (...)
  local l = unstash({...})
  return(join({"define-macro"}, l))
end})
setenv("special", {_stash = true, macro = function (...)
  local l = unstash({...})
  return(join({"define-special"}, l))
end})
setenv("curly", {_stash = true, macro = function (module, func)
  return({"get", module, {"quote", func}})
end})
setenv("multi", {_stash = true, macro = function (name, val, argc)
  if nil63(argc) then
    argc = 2
  end
  if atom63(val) then
    local _x71 = {"x"}
    _x71.rest = "ys"
    return({"mac", name, "l", {"with", "e", {"quote", {"do"}}, {"step", _x71, {"tuple", "l", argc}, {"add", "e", {"quasiquote", {{"unquote", {"quote", val}}, {"unquote", "x"}, {"unquote-splicing", "ys"}}}}}}})
  else
    local _x88 = {"x"}
    _x88.rest = "ys"
    return({"mac", name, "l", {"with", "e", {"quote", {"do"}}, {"step", "it", {"tuple", "l", argc}, {"let", {_x88, "it"}, {"add", "e", val}}}}})
  end
end})
setenv("vars", {_stash = true, macro = function (...)
  local l = unstash({...})
  local e = {"do"}
  local _x96 = tuple(l, 2)
  local _n1 = _35(_x96)
  local _i1 = 0
  while _i1 < _n1 do
    local _id1 = _x96[_i1 + 1]
    local x = _id1[1]
    local ys = cut(_id1, 1)
    add(e, join({"var", x}, ys))
    _i1 = _i1 + 1
  end
  return(e)
end})
setenv("defs", {_stash = true, macro = function (...)
  local l = unstash({...})
  local e = {"do"}
  local _x104 = tuple(l, 2)
  local _n3 = _35(_x104)
  local _i3 = 0
  while _i3 < _n3 do
    local _id3 = _x104[_i3 + 1]
    local x = _id3[1]
    local ys = cut(_id3, 1)
    add(e, join({"def", x}, ys))
    _i3 = _i3 + 1
  end
  return(e)
end})
setenv("syms", {_stash = true, macro = function (...)
  local l = unstash({...})
  local e = {"do"}
  local _x112 = tuple(l, 2)
  local _n5 = _35(_x112)
  local _i5 = 0
  while _i5 < _n5 do
    local _id5 = _x112[_i5 + 1]
    local x = _id5[1]
    local ys = cut(_id5, 1)
    add(e, join({"sym", x}, ys))
    _i5 = _i5 + 1
  end
  return(e)
end})
setenv("macs", {_stash = true, macro = function (...)
  local l = unstash({...})
  local e = {"do"}
  local _x120 = tuple(l, 3)
  local _n7 = _35(_x120)
  local _i7 = 0
  while _i7 < _n7 do
    local _id7 = _x120[_i7 + 1]
    local x = _id7[1]
    local ys = cut(_id7, 1)
    add(e, join({"mac", x}, ys))
    _i7 = _i7 + 1
  end
  return(e)
end})
setenv("specials", {_stash = true, macro = function (...)
  local l = unstash({...})
  local e = {"do"}
  local _x128 = tuple(l, 3)
  local _n9 = _35(_x128)
  local _i9 = 0
  while _i9 < _n9 do
    local _id9 = _x128[_i9 + 1]
    local x = _id9[1]
    local ys = cut(_id9, 1)
    add(e, join({"special", x}, ys))
    _i9 = _i9 + 1
  end
  return(e)
end})
setenv("lib", {_stash = true, macro = function (name)
  return({"def", name, {"require", {"quote", name}}})
end})
setenv("use", {_stash = true, macro = function (name)
  return({"var", name, {"require", {"quote", name}}})
end})
setenv("libs", {_stash = true, macro = function (...)
  local l = unstash({...})
  local e = {"do"}
  local _x148 = tuple(l, 1)
  local _n11 = _35(_x148)
  local _i11 = 0
  while _i11 < _n11 do
    local _id11 = _x148[_i11 + 1]
    local x = _id11[1]
    local ys = cut(_id11, 1)
    add(e, join({"lib", x}, ys))
    _i11 = _i11 + 1
  end
  return(e)
end})
setenv("uses", {_stash = true, macro = function (...)
  local l = unstash({...})
  local e = {"do"}
  local _x156 = tuple(l, 1)
  local _n13 = _35(_x156)
  local _i13 = 0
  while _i13 < _n13 do
    local _id13 = _x156[_i13 + 1]
    local x = _id13[1]
    local ys = cut(_id13, 1)
    add(e, join({"use", x}, ys))
    _i13 = _i13 + 1
  end
  return(e)
end})
local compiler = require("compiler")
local reader = require("reader")
local system = require("system")
local stream = reader.stream
local read_all = reader["read-all"]
local read_file = system["read-file"]
local write_file = system["write-file"]
env = system["get-environment-variable"]
macex = compiler.expand
comp = function (_)
  return(print(compile(macex(_))))
end
write1 = system.write
write = function (_)
  write1(tostr(_))
  return(nil)
end
setenv("t", {_stash = true, symbol = true})
function err(msg, ...)
  local _r12 = unstash({...})
  local _id14 = _r12
  local l = cut(_id14, 0)
  if nil63(msg) then
    msg = "fatal"
  end
  local _e4
  if none63(l) then
    _e4 = tostr(msg)
  else
    _e4 = apply(cat, join({tostr(msg), ": "}, map(str, l)))
  end
  local x = _e4
  error(x)
end
setenv("cmp", {_stash = true, macro = function (x, y)
  return({"=", {"do", x}, {"do", y}})
end})
setenv("def?", {_stash = true, macro = function (x)
  return({"is?", x})
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
fn63 = function63
str63 = string63
num63 = number63
atom = atom63
false63 = testify(false)
lst63 = obj63
list63 = obj63
len = _35
idfn = function (_)
  return(_)
end
tostr = function (_)
  if str63(_) then
    return(_)
  else
    return(str(_))
  end
end
tolist = function (_)
  if list63(_) then
    return(_)
  else
    return({_})
  end
end
parts = function (_)
  return({vals(_), keys(_)})
end
acons = function (_)
  return(not atom63(_))
end
alist = function (_)
  return(acons(_) and (keys63(_) or some63(_)))
end
empty = function (_)
  return(acons(_) and not keys63(_) and none63(_))
end
no = function (_)
  return(nil63(_) or false63(_) or empty(_))
end
t63 = function (_)
  return(not no(_))
end
setenv("is", {_stash = true, macro = function (...)
  local l = unstash({...})
  if one63(l) then
    return({"not", join({"no"}, l)})
  else
    return(join({"cmp"}, l))
  end
end})
function map1(f, lst)
  o(lst, {})
  local val = nil
  local _x178 = lst
  local _n14 = _35(_x178)
  local _i14 = 0
  while _i14 < _n14 do
    local x = _x178[_i14 + 1]
    val = f(x)
    _i14 = _i14 + 1
  end
  return(val)
end
function mapnil(...)
  local l = unstash({...})
  apply(map1, l)
  return(nil)
end
setenv("assert", {_stash = true, macro = function (...)
  local xs = unstash({...})
  local e = {"let", "bad", "nil"}
  local _x192 = xs
  local _n16 = _35(_x192)
  local _i16 = 0
  while _i16 < _n16 do
    local cond = _x192[_i16 + 1]
    add(e, {"unless", {"do", cond}, {"set", "bad", {"quote", str(cond)}}})
    _i16 = _i16 + 1
  end
  add(e, {"when", {"is?", "bad"}, {"err", "\"assertion failed\"", "bad"}})
  return(e)
end})
setenv("be", {_stash = true, macro = function (...)
  local l = unstash({...})
  return(join({"assert"}, l))
end})
setenv("w/uniq", {_stash = true, macro = function (x, ...)
  local _r30 = unstash({...})
  local _id16 = _r30
  local body = cut(_id16, 0)
  if atom63(x) then
    return(join({"let-unique", {x}}, body))
  else
    return(join({"let-unique", x}, body))
  end
end})
setenv("ado", {_stash = true, macro = function (x, ...)
  local _r32 = unstash({...})
  local _id18 = _r32
  local ys = cut(_id18, 0)
  return(join({"let", "it", x}, ys))
end})
setenv("do1", {_stash = true, macro = function (x, ...)
  local _r34 = unstash({...})
  local _id20 = _r34
  local ys = cut(_id20, 0)
  local g = unique("g")
  return(join({"let", g, x}, ys, {g}))
end})
setenv("but", {_stash = true, macro = function (cond, _then, ...)
  local _r36 = unstash({...})
  local _id22 = _r36
  local _else = cut(_id22, 0)
  return({"if", cond, _then, join({"do"}, _else)})
end})
setenv("isnt", {_stash = true, macro = function (cond, _then, ...)
  local _r38 = unstash({...})
  local _id24 = _r38
  local _else = cut(_id24, 0)
  return({"if", {"not", cond}, _then, join({"do"}, _else)})
end})
setenv("lastly", {_stash = true, macro = function (x, ...)
  local _r40 = unstash({...})
  local _id26 = _r40
  local ys = cut(_id26, 0)
  return({"do1", join({"do"}, ys), x})
end})
setenv("after", {_stash = true, macro = function (x, ...)
  local _r42 = unstash({...})
  local _id28 = _r42
  local ys = cut(_id28, 0)
  return({"let", {{"ok", "v"}, {"guard", {"do", x}}}, {"if", "ok", "v", join({"lastly", {"err", "v"}}, ys)}})
end})
setenv("o", {_stash = true, macro = function (...)
  local l = unstash({...})
  local e = {"do"}
  local r = "nil"
  local _x268 = pair(l)
  local _n18 = _35(_x268)
  local _i18 = 0
  while _i18 < _n18 do
    local _id30 = _x268[_i18 + 1]
    local _var1 = _id30[1]
    local val = _id30[2]
    add(e, {"if", {"nil?", _var1}, {"set", _var1, val}})
    r = _var1
    _i18 = _i18 + 1
  end
  add(e, r)
  return(e)
end})
setenv("w/args", {_stash = true, macro = function (l, args, ...)
  local _r44 = unstash({...})
  local _id32 = _r44
  local body = cut(_id32, 0)
  if nil63(l) then
    l = {}
  end
  if nil63(args) then
    args = {}
  end
  local g = unique("g")
  return(join({"let", {g, l, "rest", {"get", g, {"quote", "rest"}}, vals(args), g, args.rest or {}, {"if", "rest", "rest", {"list"}}}}, body))
end})
setenv("yesno", {_stash = true, macro = function (name, body)
  local _x300 = {"x", "yes"}
  _x300.rest = "l"
  return({"mac", name, _x300, {"o", "yes", "t"}, {"quasiquote", {"ado", {"unquote", "x"}, {"if", {"unquote", {"quote", body}}, {"do", {"unquote", "yes"}}, {"do", {"unquote-splicing", "l"}}}}}})
end})
setenv("any?", {_stash = true, macro = function (x, yes, ...)
  local _r48 = unstash({...})
  local _id34 = _r48
  local l = cut(_id34, 0)
  if nil63(yes) then
    yes = true
  end
  return({"ado", x, {"if", {"and", {"list?", "it"}, {"or", {"keys?", "it"}, {"some?", "it"}}}, {"do", yes}, join({"do"}, l)}})
end})
setenv("0?", {_stash = true, macro = function (x, yes, ...)
  local _r50 = unstash({...})
  local _id36 = _r50
  local l = cut(_id36, 0)
  if nil63(yes) then
    yes = true
  end
  return({"ado", x, {"if", {"or", {"nil?", "it"}, {"none?", "it"}}, {"do", yes}, join({"do"}, l)}})
end})
setenv("1?", {_stash = true, macro = function (x, yes, ...)
  local _r52 = unstash({...})
  local _id38 = _r52
  local l = cut(_id38, 0)
  if nil63(yes) then
    yes = true
  end
  return({"ado", x, {"if", {"and", {"list?", "it"}, {"one?", "it"}}, {"do", yes}, join({"do"}, l)}})
end})
setenv("2?", {_stash = true, macro = function (x, yes, ...)
  local _r54 = unstash({...})
  local _id40 = _r54
  local l = cut(_id40, 0)
  if nil63(yes) then
    yes = true
  end
  return({"ado", x, {"if", {"and", {"list?", "it"}, {"two?", "it"}}, {"do", yes}, join({"do"}, l)}})
end})
_any63 = function (_)
  local bad = nil
  if not( nil63(_) or list63(_)) then
    bad = "(\"or\" (\"nil?\" \"_\") (\"list?\" \"_\"))"
  end
  if is63(bad) then
    err("assertion failed", bad)
  end
  local it = _
  if list63(it) and (keys63(it) or some63(it)) then
    return(true)
  end
end
_063 = function (_)
  local bad = nil
  if not( nil63(_) or list63(_)) then
    bad = "(\"or\" (\"nil?\" \"_\") (\"list?\" \"_\"))"
  end
  if is63(bad) then
    err("assertion failed", bad)
  end
  local it = _
  if nil63(it) or none63(it) then
    return(true)
  end
end
_163 = function (_)
  local bad = nil
  if not( nil63(_) or list63(_)) then
    bad = "(\"or\" (\"nil?\" \"_\") (\"list?\" \"_\"))"
  end
  if is63(bad) then
    err("assertion failed", bad)
  end
  local it = _
  if list63(it) and one63(it) then
    return(true)
  end
end
_263 = function (_)
  local bad = nil
  if not( nil63(_) or list63(_)) then
    bad = "(\"or\" (\"nil?\" \"_\") (\"list?\" \"_\"))"
  end
  if is63(bad) then
    err("assertion failed", bad)
  end
  local it = _
  if list63(it) and two63(it) then
    return(true)
  end
end
setenv("complement", {_stash = true, macro = function (f)
  local g = unique("g")
  return({"fn", g, {"not", {"apply", f, g}}})
end})
setenv("repeat", {_stash = true, macro = function (n, ...)
  local _r62 = unstash({...})
  local _id42 = _r62
  local l = cut(_id42, 0)
  local g = unique("g")
  return(join({"for", g, n}, l))
end})
setenv("push", {_stash = true, macro = function (lst, x)
  return({"ado", lst, {"add", "it", x}, "it"})
end})
setenv("pop", {_stash = true, macro = function (lst)
  return({"ado", lst, {"last", "it"}, {"drop", "it"}})
end})
setenv("w/push", {_stash = true, macro = function (lst, x, ...)
  local _r68 = unstash({...})
  local _id44 = _r68
  local l = cut(_id44, 0)
  local g = unique("g")
  return({"let", g, {"push", lst, x}, join({"lastly", {"pop", g}}, l)})
end})
setenv("lfn", {_stash = true, macro = function (name, args, body, ...)
  local _r70 = unstash({...})
  local _id46 = _r70
  local l = cut(_id46, 0)
  local _e5
  if some63(l) then
    _e5 = l
  else
    _e5 = {name}
  end
  return(join({"let", name, "nil", {"set", name, {"fn", args, body}}}, _e5))
end})
setenv("afn", {_stash = true, macro = function (args, body, ...)
  local _r72 = unstash({...})
  local _id48 = _r72
  local l = cut(_id48, 0)
  return(join({"lfn", "self", args, body}, l))
end})
setenv("letmac", {_stash = true, macro = function (name, args, body, ...)
  local _r74 = unstash({...})
  local _id50 = _r74
  local l = cut(_id50, 0)
  return(join({"let-macro", {{name, args, body}}}, l))
end})
setenv("add", {_stash = true, macro = function (l, x)
  local _x440 = {"target"}
  _x440.js = {"do", {{"get", l, {"quote", "push"}}, x}, "nil"}
  _x440.lua = {{"get", "table", {"quote", "insert"}}, l, x}
  return(_x440)
end})
setenv("accum", {_stash = true, macro = function (name, ...)
  local _r78 = unstash({...})
  local _id52 = _r78
  local body = cut(_id52, 0)
  local g = unique("g")
  return({"with", g, join(), join({"letmac", name, {"x"}, {"list", {"quote", "add"}, {"quote", g}, "x"}}, body)})
end})
setenv("bag", {_stash = true, macro = function (...)
  local l = unstash({...})
  return(join({"accum", "put"}, l))
end})
setenv("sbag", {_stash = true, macro = function (...)
  local l = unstash({...})
  return({"sort", join({"bag"}, l)})
end})
setenv("nor", {_stash = true, macro = function (...)
  local l = unstash({...})
  return({"not", join({"or"}, l)})
end})
setenv("ifnot", {_stash = true, macro = function (cond, ...)
  local _r80 = unstash({...})
  local _id54 = _r80
  local l = cut(_id54, 0)
  return(join({"if", {"not", cond}}, l))
end})
setenv("nif", {_stash = true, macro = function (...)
  local l = unstash({...})
  return(join({"ifnot"}, l))
end})
setenv("iflet", {_stash = true, macro = function (name, ...)
  local _r82 = unstash({...})
  local _id57 = _r82
  local l = cut(_id57, 0)
  if some63(l) then
    local _id58 = l
    local x = _id58[1]
    local a = _id58[2]
    local bs = cut(_id58, 2)
    local _e6
    if one63(l) then
      _e6 = name
    else
      _e6 = {"if", name, a, join({"iflet", name}, bs)}
    end
    return({"let", name, x, _e6})
  end
end})
setenv("whenlet", {_stash = true, macro = function (name, ...)
  local _r84 = unstash({...})
  local _id61 = _r84
  local l = cut(_id61, 0)
  if some63(l) then
    local _id62 = l
    local x = _id62[1]
    local ys = cut(_id62, 1)
    local _e7
    if one63(l) then
      _e7 = name
    else
      _e7 = join({"do"}, ys)
    end
    return({"let", name, x, _e7})
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
setenv("kv", {_stash = true, macro = function (lst, ...)
  local _r86 = unstash({...})
  local _id64 = _r86
  local body = cut(_id64, 0)
  return(join({"each", {"k", "v"}, lst}, body))
end})
setenv("skv", {_stash = true, macro = function (lst, ...)
  local _r88 = unstash({...})
  local _id66 = _r88
  local body = cut(_id66, 0)
  local g = unique("g")
  return({"let", g, lst, {"step", "k", {"sbag", {"kv", g, join({"isnt", {"num?", "k"}, {"put", "k"}}, body)}}, join({"let", "v", {"get", g, "k"}}, body)}})
end})
function kvs(x)
  local _g = {}
  local _o = x
  local k = nil
  for k in next, _o do
    local v = _o[k]
    if num63(k) then
      table.insert(_g, v)
    else
      table.insert(_g, {k, v})
    end
  end
  return(_g)
end
function car(x)
  if not no(x) then
    return(hd(x))
  end
end
function cdr(x)
  if not no(x) then
    local it = tl(x)
    local _it = it
    if nil63(_it) or none63(_it) then
      return(kvs(_it))
    else
      return(_it)
    end
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
  local _o1 = xs
  local k = nil
  for k in next, _o1 do
    local v = _o1[k]
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
  local _g1 = {}
  local _o2 = lst
  local _i21 = nil
  for _i21 in next, _o2 do
    local item = _o2[_i21]
    if sep then
      table.insert(_g1, sep)
    else
      sep = x
    end
    table.insert(_g1, item)
  end
  return(_g1)
end
function keep(f, xs)
  f = testify(f)
  local _g2 = {}
  local _x545 = xs
  local _n22 = _35(_x545)
  local _i22 = 0
  while _i22 < _n22 do
    local x = _x545[_i22 + 1]
    if f(x) then
      table.insert(_g2, x)
    end
    _i22 = _i22 + 1
  end
  return(_g2)
end
function rem(f, xs)
  return(keep(function (...)
    local _g3 = unstash({...})
    return(not apply(testify(f), _g3))
  end, xs))
end
rev = reverse
wschars = {" ", "\t", "\n", "\r"}
function ws63(s)
  local i = 0
  while i < len(s) do
    local c = char(s, i)
    if in63(c, wschars) then
      return(true)
    end
    i = i + 1
  end
end
function rtrim(s, ...)
  local _r108 = unstash({...})
  local _id67 = _r108
  local f = _id67.f
  while some63(s) and (f or ws63)(char(s, edge(s))) do
    s = clip(s, 0, edge(s))
  end
  return(s)
end
function ltrim(s, ...)
  local _r109 = unstash({...})
  local _id68 = _r109
  local f = _id68.f
  while some63(s) and (f or ws63)(char(s, 0)) do
    s = clip(s, 1, len(s))
  end
  return(s)
end
function trim(s, ...)
  local _r110 = unstash({...})
  local _id69 = _r110
  local f = _id69.f
  return(rtrim(ltrim(s, {_stash = true, f = f}), {_stash = true, f = f}))
end
function endswith(s, ending)
  local i = len(s) - len(ending)
  return(i == search(s, ending, i))
end
function startswith(s, prefix)
  return(search(s, prefix) == 0)
end
function pr(...)
  local l = unstash({...})
  local _g4 = l
  local rest = _g4.rest
  local _id70 = _g4
  local x = _id70[1]
  local _e8
  if rest then
    _e8 = rest
  else
    _e8 = {}
  end
  local xs = _e8
  local _id71 = tolist(xs)
  local sep = _id71[1]
  local lh = _id71[2]
  local rh = _id71[3]
  if nil63(sep) then
    sep = ""
  end
  local c = nil
  if lh then
    write(lh)
  end
  if sep then
    local _x553 = l
    local _n23 = _35(_x553)
    local _i23 = 0
    while _i23 < _n23 do
      local _x554 = _x553[_i23 + 1]
      if c then
        write(c)
      else
        c = tostr(sep)
      end
      write(tostr(_x554))
      _i23 = _i23 + 1
    end
  else
    local _x555 = l
    local _n24 = _35(_x555)
    local _i24 = 0
    while _i24 < _n24 do
      local _x556 = _x555[_i24 + 1]
      write(tostr(_x556))
      _i24 = _i24 + 1
    end
  end
  if rh then
    write(rh)
  end
  if l then
    return(hd(l))
  end
end
function prn(...)
  local l = unstash({...})
  local _g5 = apply(pr, l)
  pr("\n")
  return(_g5)
end
function p(...)
  local l = unstash({...})
  apply(prn, l)
  return(nil)
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
  local _r121 = unstash({...})
  local _id73 = _r121
  local l = cut(_id73, 0)
  local gp = unique("gp")
  return({"let", {gp, path, v, {"filechars", gp}}, {"set", v, join({"do"}, l)}, {"writefile", gp, v}})
end})
args = function (_)
  return(readstr(env("cmdline")))
end
host = function (_)
  return(env("LUMEN_HOST") or "")
end
host63 = function (_)
  return(search(host(), _))
end
luajit63 = function (_)
  return(host63("luajit"))
end
comp = function (_)
  return(print(compile(macex(_))))
end
macex = compiler.expand
readstr = function (_)
  return(read_all(stream(_)))
end
function prnerr(_x574)
  local _id74 = _x574
  local expr = _id74[1]
  local msg = _id74[2]
  prn("Error in ", file, ": ")
  prn("   ", msg)
  prn("The error occurred while evaluating: ")
  prn(expr)
  return(msg)
end
function loadstr(s, ...)
  local _r129 = unstash({...})
  local _id75 = _r129
  local print = _id75.print
  local on_err = _id75["on-err"]
  local verbose = _id75.verbose
  local _x576 = readstr(s)
  local _n25 = _35(_x576)
  local _i25 = 0
  while _i25 < _n25 do
    local expr = _x576[_i25 + 1]
    if "1" == env("VERBOSE") then
      prn(str(expr))
    end
    if "1" == env("COMP") then
      prn(comp(expr))
    end
    local _x577 = nil
    local _msg = nil
    local _trace = nil
    local _e9
    if xpcall(function ()
      _x577 = eval(expr)
      return(_x577)
    end, function (m)
      _msg = clip(m, search(m, ": ") + 2)
      _trace = debug.traceback()
      return(_trace)
    end) then
      _e9 = {true, _x577}
    else
      _e9 = {false, _msg, _trace}
    end
    local _id76 = _e9
    local ok = _id76[1]
    local x = _id76[2]
    if ok and print == true then
      prn(x)
    end
    if not ok then
      (on_err or prnerr)({expr, x})
    end
    _i25 = _i25 + 1
  end
end
function load(file, ...)
  local _r132 = unstash({...})
  local _id77 = _r132
  local on_err = _id77["on-err"]
  local verbose = _id77.verbose
  if verbose then
    prn("Loading ", file)
  end
  return(loadstr(read_file(file), {_stash = true, ["on-err"] = on_err, verbose = verbose}))
end
if luajit63() then
  ffi = require("ffi")
  setenv("defc", {_stash = true, macro = function (name, val)
    local _e10
    if id_literal63(val) then
      _e10 = inner(val)
    else
      _e10 = val
    end
    return({"do", {{"get", "ffi", {"quote", "cdef"}}, {"quote", _e10}}, {"def", name, {"get", {"get", "ffi", {"quote", "C"}}, {"quote", name}}}})
  end})
  ffi.cdef("int usleep (unsigned int usecs)")
  usleep = ffi.C.usleep
  function sleep(secs)
    usleep(secs * 1000000)
    return(nil)
  end
end
function shell(cmd)
  local function exec(s)
    local h = io.popen(cmd)
    local result = h.read(h, "*a")
    local _e11
    if env("VERBOSE") then
      _e11 = prn(result)
    end
    local _g6 = result
    h.close(h)
    return(_g6)
  end
  return(exec(cmd))
end
function exit(code)
  return(os.exit(code))
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
  local rh = _id.rh
  local lh = _id.lh
  return((lh or "") .. x .. (rh or ""))
end
function q(x)
  if ws63(x) then
    return(surround(x, {_stash = true, rh = "\'", lh = "\'"}))
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
  table.insert(pushds, pwd())
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
  local _e
  if pattern then
    _e = _36("find", ".", "|", "grep", "-v", "'/\\.monki/'", "|", "grep", pattern, "|", "cat")
  else
    _e = _36("find", ".", "|", "grep", "-v", "'/\\.monki/'", "|", "cat")
  end
  local s = trim(_e)
  local _e1
  if s and some63(s) then
    _e1 = map(fixpath, split(s, "\n"))
  else
    _e1 = {}
  end
  local _g = _e1
  popd()
  return(_g)
end
function which(prog)
  local _x31 = nil
  local _msg = nil
  local _trace = nil
  local _e2
  if xpcall(function ()
    _x31 = _36("which", prog)
    return(_x31)
  end, function (m)
    _msg = clip(m, search(m, ": ") + 2)
    _trace = debug.traceback()
    return(_trace)
  end) then
    _e2 = {true, _x31}
  else
    _e2 = {false, _msg, _trace}
  end
  local _id5 = _e2
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
  local _e3
  if freebsd63() then
    local _e4
    if which("gmake") then
      _e4 = "gmake"
    else
      error("Install gmake by running:  sudo pkg install gmake")
      _e4 = nil
    end
    _e3 = _e4
  else
    _e3 = "make"
  end
  local prog = _e3
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
  local _e5
  if not search(fs, x) then
    error(file .. ": patch: failed to find code:\n  " .. x)
    _e5 = nil
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
  local _x66 = variables
  local _n = _35(_x66)
  local _i = 0
  while _i < _n do
    local v = _x66[_i + 1]
    patch1(file, "(define " .. v .. " ", "(define-global " .. v .. " ")
    _i = _i + 1
  end
end
function _36(...)
  local args = unstash({...})
  local hush = args.hush
  local c = ""
  local cmds = {}
  local _x68 = args
  local _n1 = _35(_x68)
  local _i1 = 0
  while _i1 < _n1 do
    local arg = _x68[_i1 + 1]
    if arg == ";" then
      table.insert(cmds, c)
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
    table.insert(cmds, c)
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
  local _x70 = {"git", "--git-dir=" .. q(j(path, ".git")), what}
  _x70.hush = true
  return(apply(_36, join(_x70, args)))
end
function gitdir(path, nocheck)
  local _e6
  if path then
    _e6 = j(path, ".monki", "git")
  else
    _e6 = j(".monki", "git")
  end
  local dst = _e6
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
  prn("")
  prn("  to run all monki.l files beneath a dir:")
  prn("    monki <dir>")
  prn("")
  prn("  to clone a git repo at a subdir:")
  prn("    monki clone <url> [revision] <subdir>")
  prn("    monki clone laarc/monki monki")
  prn("    monki cp laarc/monki monki")
  prn("    monki c laarc/monki monki")
  prn("")
  prn("")
  prn("  to run a git command on the underlying .git repo of a monki folder:")
  prn("    cd some-monki-folder/")
  prn("    monki git log")
  prn("    monki git status")
  prn("    monki g status")
  prn("")
  prn("  to get a repl")
  prn("    monki repl")
  prn("    monki r")
  prn("")
  prn("  to eval some expressions:")
  prn("    monki eval '1 2 3 (+ 1 2) (list 1 2)'")
  prn("    monki e '1 2 3'")
  prn("")
  prn("  to eval some expressions and see what they compile to:")
  prn("    COMP=1 monki eval '1 2 3 (+ 1 2) (list 1 2)'")
  return(prn(""))
end
function mmain(argv)
  if none63(argv or {}) then
    return(monkitree(pwd()))
  end
  local op = argv[1]
  local params = cut(argv, 1)
  if in63(op, {"help", "h", "--help", "-h", "/?", "-?", "?", "haalp"}) then
    musage()
    return
  end
  if endswith(op, ".l") then
    return(monki(op))
  end
  if in63(op, {"eval", "e"}) then
    loadstr(clip(env("cmdline"), _35(op)), {_stash = true, print = true})
    return
  end
  if in63(op, {"compile", "comp"}) then
    local _x74 = params
    local _n3 = _35(_x74)
    local _i3 = 0
    while _i3 < _n3 do
      local file = _x74[_i3 + 1]
      if file == "js" or file == "lua" then
        target = file
      else
        local x = filechars(file)
        local _x75 = nil
        local _msg1 = nil
        local _trace1 = nil
        local _e7
        if xpcall(function ()
          _x75 = readstr(x)
          return(_x75)
        end, function (m)
          _msg1 = clip(m, search(m, ": ") + 2)
          _trace1 = debug.traceback()
          return(_trace1)
        end) then
          _e7 = {true, _x75}
        else
          _e7 = {false, _msg1, _trace1}
        end
        local _id8 = _e7
        local ok = _id8[1]
        local val = _id8[2]
        if not ok then
          prn(val)
          err("failed to read " .. file)
        end
        x = val
        x = macex(join({"do"}, x))
        x = compile(x)
        prn(x)
      end
      _i3 = _i3 + 1
    end
    return
  end
  if in63(op, {"repl", "r"}) then
    return
  end
  if in63(op, {"clone", "cp", "c"}) then
    if not( len(argv) > 1) then
      musage()
      return
    end
    local dst = argv[edge(argv) + 1]
    if dir63(dst) then
      error("monki clone: already exists: " .. dst)
    end
    mkdir(dst)
    _36("echo", "(clone " .. inner(str(cut(params, 0, edge(params)))) .. ")", ">", j(dst, "monki.l"))
    return(monkitree(dst))
  end
  if op == "git" or op == "g" then
    prn(apply(git, join({gitdir(pwd())}, params or {})))
    return
  end
  local _x82 = argv
  local _n4 = _35(_x82)
  local _i4 = 0
  while _i4 < _n4 do
    local arg = _x82[_i4 + 1]
    if dir63(arg) then
      monkitree(arg)
    else
      if endswith(arg, ".l") then
        monki(arg)
      else
        error("unknown cmd " .. arg)
      end
    end
    _i4 = _i4 + 1
  end
end
mmain(args())
main()
