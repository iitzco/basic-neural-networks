function set = bits_combination_set (bits)
    set = bits_set_aux(1,bits,[]);
endfunction

function ret = bits_set_aux (index, bits, curr_list)
    if (index-1==bits)
        ret = curr_list;
        return;
    endif
    curr_list(index)=0;
    ret = bits_set_aux(index+1,bits,curr_list);
    curr_list(index)=1;
    ret = vertcat(ret,bits_set_aux(index+1,bits,curr_list));
    return;
endfunction

