require('dl')
v = dl.FloatArray(10)
for i=1,10 do v[i-1] = math.random() end
for i=1,10 do 
	io.write( tostring(v[i-1]) .. ',' )
end 
print()
