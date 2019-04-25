---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by jow.hou.
--- DateTime: 2019/4/25 10:04
---this file is for me to practice table
---__index 用来索引  当__index为函数是直接调用
local table1 = { jow = "hi" }
local table2 = { wofead = "hello" }
local table3 = { jowney = "nice" }
print(table1.jow, table1.wofead) --> hi nil
setmetatable(table1, { __index = table2 })
print(table1.jow, table1.wofead) --> hi hello
setmetatable(table1, { __index = table3 })
print(table1.jow, table1.wofead) --> hi nil
print(table1.jow, table1.jowney) --> hi nice 说明每一个表只能拥有一个元表 而且会被覆盖

local function say(t, key)
    rawset(t, key, key)
end
setmetatable(table1, { __index = say })
print(table1.jow, table1.wofead) --> hi nil  --在这里table1.wofead 访问到的还是nil，因为是访问之后才被赋值，但是你可以通过函数return的方式立即得到这个值
print(table1.jow, table1.wofead) --> hi wofead
local function say1(t, key)
    rawset(t, key, key)
    return key
end
setmetatable(table1, { __index = say1 })
print(table1.jow, table1.wofead1) --> hi wofead

table1.jowney = "meet0"
--只有在访问的时候才会涉及到__index所指向的方法，赋值的时候不会
print(table1.jow, table1.wofead2)

local table4 = {galvin = "galvin"}
local table5 = {cow = "cow"}
setmetatable(table4,{__newindex = table5}) --存在__newindex键值和不存在__newindex键值的区别在于，不存在时给一个不存在的键值赋值，会直接在
--原来的表上添加一个键值然后赋值，存在__newindex时，若__newindex指向一个表，则在__newindex指向的表中添加键值，如果是函数，则直接调用函数
table4.sicity = "sicity"
print(table4.sicity)
local table6 = getmetatable(table4) -->{__newindex = table5}
print(table5.sicity)
local function say2()
    print("say2")
end
setmetatable(table4, {__newindex = say2})
print(table4.galvin)

--__call 元方法让table带任意参数，然后通过t(param)来调用这个方法






