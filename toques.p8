pico-8 cartridge // http://www.pico-8.com
version 43
__lua__
#include vector.p8

m = vector()
f = vector()
b={
			p=vector(),
			a=vector(),
			v=vector()
}

function _init()
		mouse.init()
		b.p.x=64
		b.a.y=.1
end

function _update()
		m.x,m.y=mouse.pos()
		f=v_lerp(f,m,0.2)
		
		if (v_dist(b.p,f)<18) then
				local dir=v_norm(v_sub(b.p,f))
				local v=v_scale(dir,2)
				local force=v_dist(m,f)/10+0.1
				v=v_scale(v,force)
				b.v=v
		end
		ball_gravity()
end

function _draw()
  cls()
  circ(m.x, m.y, 2, 1)
  circ(f.x, f.y, 8, 2)
  circ(b.p.x, b.p.y, 10, 3)
end
-->8
--- helpers

mouse = {
  init = function()
    poke(0x5f2d, 1)
  end,
  -- return int:x, int:y, onscreen:bool
  pos = function()
    local x,y = stat(32)-1,stat(33)-1
    return stat(32)-1,stat(33)-1
  end,
  -- return int:button [0..4]
  -- 0 .. no button
  -- 1 .. left
  -- 2 .. right
  -- 4 .. middle
  button = function()
    return stat(34)
  end,
}


function dist(x1,y1,x2,y2)
	local xdif=x1-x2
	local ydif=y1-y2

	local atan=atan2(xdif,ydif)

	local xdist=cos(atan)*xdif
	local ydist=sin(atan)*ydif

	return xdist+ydist
end
-->8
function ball_gravity()
		b.v.x+=b.a.x
		b.v.y+=b.a.y
		b.p.x+=b.v.x
		b.p.y+=b.v.y
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
