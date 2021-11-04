basicbuff = 2.25;
buffplus = 0.5;
coolreset = 0.1;

cooltime = 171;
basictime = 41;
basicdmg = 0.66;
timestep = 6;
dmgstep = 0.03;

dmg = 0;
lastbuff = 0;
buffstate = 1;
coolstate = rand < coolreset;

for i = 1:100000
    dmg = dmg + 1; 
    if buffstate == 1
        if i - lastbuff > basictime * (basicbuff + buffplus)
            buffstate = 0;
        else
            dmg = dmg + basicdmg + floor((i - lastbuff)/timestep) * dmgstep;
        end
    else if (i - lastbuff >= cooltime) || (coolstate == 1)
            coolstate = rand < coolreset;
            lastbuff = i;
            buffstate = 1;
        end
    end
end