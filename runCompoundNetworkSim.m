%% Function runCompoundNetworkSim()
% Parameters
% K - the number of packets in the application message
% p - the probability of failure
% N - the number of simulations to run
%
% Returns: the average numeric result across the total simulations

% Multiply the success rate of the parallel and the linear together to get
% the total success rate, then subtract that by one to get rate of failure

function result = runCompoundNetworkSim(K, p, N)
    simResults = ones(1,N); % a place to store the result of each simulation
    % Calculating the probability of a compound network
    s = (1 - p*p)*(1-p);
    p = (1-s);

    for i=1:N
        txAttemptCount = 0; % transmission count
        pktSuccessCount = 0; % number of packets that have made it across

        while pktSuccessCount < K

            r = rand; % gen random num to determine if packet is successful (r > p)
            txAttemptCount = txAttemptCount + 1; % count 1st attempt

            % while packet transmissions is not successful (r < p)
            while r < p
                r = rand; % transmit again, generate new success check value r
                txAttemptCount = txAttemptCount + 1; % count additional attempt
            end

        pktSuccessCount = pktSuccessCount + 1; % increase success count after success (r > p)

        end

    simResults(i) = txAttemptCount; % record total number of attempted
                                    %transmissions before entire application
                                    %msg (K successful packets) transmitted
    end

    result = mean(simResults);
end