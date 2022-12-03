function replay(obj,event,Game)
if Game==1
    File="Memorygame.m"
elseif Game==2
    File="CookieClicker"
end
close('all')
run(File)
end
