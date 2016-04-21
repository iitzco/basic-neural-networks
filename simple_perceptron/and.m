function ret = and (l)
    for i=1:columns(l)
        if (l(i)==0)
            ret = 0;
            return;
        endif
    endfor
    ret = 1;
endfunction
