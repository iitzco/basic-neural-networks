function ret = step_ft (a)
    if (a==0)
        ret = 1;
        return;
    endif
    ret = (sign(a) * 0.5) + 0.5;
endfunction
