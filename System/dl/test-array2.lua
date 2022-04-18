require('dl')

function print_array(a)
    for i=0,a:size()-1 do io.write(a[i],',') end
    print()
end

a = dl.CreateArrayFloat({1,21,3,45,15})
print("size=",a:size())
print_array(a)
dl.reverse_float_vector(a)
print_array(a)
print(dl.min_float_vector(a))
print(dl.max_float_vector(a))
x = dl.bsearch_float_vector(a,45)
print(x)
dl.sort_float_vector(a)
x = dl.bsearch_float_vector(a,45)
print(x)
dl.shuffle_float_vector(a)
print_array(a)
dl.replace_float_vector(a,1,1001)
print_array(a)

r = dl.RefArray(3)
r[0] = {"Charles Babbage","555-555-5555",5000}
r[1] = {"Randy Schmidt","555-555-5555",100000}
r[2] = {"Lucy James","555-555-5555",-10000}

for i=1,r:size() do
    table.foreach(r[i-1],print)
end

function random_array(size)
    local r = dl.FloatArray(size)
    for i=0,size-1 do r[i] = math.random() end 
    return r 
end 

v = random_array(5)

r = a + v 
print_array(r)

x = dl.FloatArray(5)
for i=0,4 do x[0] = (i+1)*1000 end
r:insert(x,1)
print_array(r)

x = r:slice(3,9)
print_array(x)

x:erase(2)
print_array(x)
x:erase(2,4)
print_array(x)