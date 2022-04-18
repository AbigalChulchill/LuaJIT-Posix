require('af')
a = af.af_float(1,10)
v = af.float_vector(10)
for i=1,10 do v[i-1]=math.random() end 
print(v[0])
a:set_vector(v,0)
r = af.float_vector(10)
r = a:get_vector(r,0)
print(r:size())
for i=1,10 do print(r[i-1]) end
