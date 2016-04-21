function ret = get_training_set (ft,bits)
    training{1} = bits_combination_set(bits);
    for i=1:rows(training{1})
        training{2}(i,:)=feval(ft,training{1}(i,:));
    endfor
    ret = training;
endfunction
