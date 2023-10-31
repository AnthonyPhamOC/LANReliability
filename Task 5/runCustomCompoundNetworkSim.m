%% Function runCustomCompoundNetworkSim()
% Parameters
% K - the number of packets in the application message
% p1 - the probability of failure for first link
% p2 - the probability of failure for second link
% p3 - the probability of failure for third link
% N - the number of simulations to run
%
% Returns: the average numeric result across the total simulations

function result = runCustomCompoundNetworkSim(K, p1, p2, p3, N)
    simResults = ones(1,N); % a place to store the result of each simulation
    % Calculating the probability of a coumpund network with links that
    % have their own probability
    s = (1 - p1*p2)*(1-p3);
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