function net = obtain_network (N, training, min_error, ft, learning_rate, graph)
    
    if (rows(training{1})!=rows(training{2}))
        printf('Wrong training set\n');
        return;
    endif

    if (min_error < 0 || min_error > 1)
        printf('Wrong error parameter, must be between 0 and 1\n');
        return;
    endif

    W = rand(N+1,1).-0.5;
    error_value = 1;
    count = 0;

    while (error_value > min_error)

        count++;
        vec_random=randperm(rows(training{1}));
        diff_vec=zeros(rows(training{1}),1);

        for i=1:rows(training{1})
            
            rand_entry=training{1}(vec_random(i),:);
            vec_entry=[-1,rand_entry];

            % Forward
    
            output = feval(ft, vec_entry * W);

            % Learning process
            
            expected = training{2}(vec_random(i),:);

            diff = expected-output;
            for j=1:rows(W)
                
                delta = learning_rate*diff*vec_entry(j);
                W(j,:) = W(j,:)+delta;
    
            endfor

        endfor

        % Calculate error

        all_entries=[ones(size(training{1},1),1).*-1 training{1}];

        net_output = all_entries * W;

        for i=1:rows(net_output)
            net_output(i) = feval(ft,net_output(i));
        endfor

        error_value = sum(abs(training{2}-net_output))/rows(training{2});
        error_vec(count) = error_value;


    endwhile

    count
    net = W;

    if (graph)
        plot(1:1:count,error_vec);
        title('Error');
        xlabel('Epocas');
        ylabel('Error');
    endif

endfunction       
