function ret = evaluate_net (net, entry)
    if (rows(net)-1 != columns(entry))
        printf('Wrong entry\n');
        return;
    endif
    ret = sign([-1,entry]*net)*0.5 + 0.5;
endfunction
