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
        vec_random = randperm(rows(training{1}));
        
        for i=1:rows(training{1})
            rand_entry = training{1}(vec_random(i),:);

            vec_entry = [-1 rand_entry];
            
            % Forward

            h = vec_entry*W;

            output = feval(ft, h);

            % Learning

            diff = training{2}(vec_random(i),:)-output;
            
            delta = vec_entry'.*(learning_rate*diff);

            W = W + delta;

        endfor

        % error

        all_entries= [ones(size(training{1},1),1).*-1 training{1}];

        net_output = feval(ft,all_entries*W);

        error_value = mean(abs(training{2}-net_output));

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
