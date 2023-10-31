% X is probability of Failure
% Y is number of transmissions
% Logarithmic y-scale
% Formula: k/(1-p*p)

% Start of all K figure
f = figure("Name", "Two Parallel Link: All K's");
axes;
xlabel("Probability of Failure");
ylabel("Number of Transmissions");
hold all;

% Calculated
% Iterates through each K
for k = [1, 5, 15, 50, 100]
    x = linspace(0, 1);
    % The E(z) equation
    y = k ./ (1-x.*x);
    plot(x,y);
end

% Simulated
% Iterates throguh each x, represents probability of failure
for x = 1:9
    % Iterates through each K
    for k = [1, 5, 15, 50, 100]
        % Calls the function to get the number of transmissions
        y = runTwoParallelLinkSim(k, x ./ 10, 1000);
        plot(x ./ 10, y, "-o", "Color", [0 0 0]);
    end
end

yscale("log");
%------------------------------------------------------------------

% K - 1
buildGraph(1);

% K - 5
buildGraph(5);

% K - 15
buildGraph(15);

% K - 50
buildGraph(50);

% K - 100
buildGraph(100);

%-----------------------------------------------------------------

% buildGraph(k) - builds the graph for each k value
%   k - the number of packets in the message
% return - None, creates a figure
function buildGraph(k)
    f = figure("Name", "Two Parallel Link: K-" + k);
    axes;
    hold all;

    xlabel("Probability of Failure");
    ylabel("Number of Transmissions")

    % Calculated
    x = linspace(0, 1);
    y = k ./ (1-x.*x);
    plot(x,y);

    % Simulated
    for x = 1:9
        y = runTwoParallelLinkSim(k, x ./ 10, 1000);
        plot(x ./ 10, y, "-o", "Color", [0 0 0]);
    end

    yscale("log");
end


