function ret = or (l)
    for i=1:columns(l)
        if (l(i)==1)
            ret = 1;
            return;
        endif
    endfor
    ret = 0;
endfunction
