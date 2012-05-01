


local rectCount = math.random(1,5)
local r = {};

for i=1,1,rectCount do
    r[i] = {};
    r[i][1] = 10 + math.random(1,100);
    r[i][2] = 10 + math.random(1,100);
    r[i][3] = 10 + math.random(1,100);
    r[i][4] = 10 + math.random(1,100);
    r[i]["duration"] = math.random();
end



local config =
{
	testEntry = 
	{
        a = 60,
        subObject = 
        {
            subObject2 = 
            {
                
            }
        }
    },
}

for i=1,1,rectCount do
    config.testEntry.subObject.subObject2["aRect"] = r[i];
end

return config