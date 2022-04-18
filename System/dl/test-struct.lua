require('jsoncpp')
s = jsoncpp.Struct('{ "x":10, "a":[100,100]; }')
print(s["x"]:asDouble())
s["y"]="hello world"
print(s["y"]:asString())
print(s["a"]:getarrayitem(1):asInt())