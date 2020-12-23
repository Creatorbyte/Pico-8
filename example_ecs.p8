-- table stuff demo by creatorbyte

--Alternative
--function make_actor()
-- local x,y=0,0
-- return {
--   draw=function(self) 
--    spr(42,x,y)
--   end,
--  update=function(self)
--    x+=1
--   end
--}
--end

actors = {} --a table to store all the actors

-- a function to make a new actor 
-- and add it to the table
function makeactor(xp,yp,sp)
    actor = {
    
        -- the variables for each new actor
        -- these will be unique to each instance
        -- and can be called and changed separately
        x = xp,
        y = yp,
        s = sp,

        -- an internal function to render this actor instance
        draw = function(self)
            spr(self.s,self.x,self.y)
        end,
        
        -- internal function to update this actor instance
        update = function(self)
        
         self.y = self.y+2*sin(t()) --just a simple oscillation
        end
    }
    add(actors, actor) -- add the actor to the table of all actors
end

function _init()
    makeactor(64,48,0) -- add a new instance
end

function _update60()

    for a in all(actors) do
        a:update() -- call the update function for each instance
    end

end

function _draw()
    cls(0) -- clear the screen between frames

    for a in all(actors) do
        a:draw() -- call the render function for each instance
    end

end
