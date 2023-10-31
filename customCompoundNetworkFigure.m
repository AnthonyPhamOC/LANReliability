% X is probability of Failure
% Y is number of transmissions
% Logarithmic y-scale
% Formula: K/((1-p*p)*(1-p))

% Figure 1: p1 = 0.1, p2 = 0.6, p3 = 0.01->0.99
f = figure("Name", "Compound Network Link: p1 = 0.1, p2 = 0.6, p3 = 0.01->0.99");
axes;
hold all;

% Iterates through each probability from 0.01 to 0.99
for x = 0:99
    buildGraph(0.1, 0.6, x ./ 100, x ./ 100);
end

% Figure 2: p1 = .6, p2 = .1, p3 = 0.01->0.99
f = figure("Name", "Compound Network Link: p1 = .6, p2 = .1, p3 = 0.01->0.99");
axes;
hold all;

% Iterates through each probability from 0.01 to 0.99
for x = 0:99
    buildGraph(0.6, 0.1, x ./ 100, x ./ 100);
end

% Figure 3: p1 = 0.1, p2 = 0.01->0.99, p3 = 0.6
f = figure("Name", "Compound Network Link: p1 = 0.1, p2 = 0.01->0.99, p3 = 0.6");
axes;
hold all;

% Iterates through each probability from 0.01 to 0.99
for x = 0:99
    buildGraph(0.1, x ./ 100, 0.6, x ./ 100);
end

% Figure 4: p1 = 0.6, p2 = 0.01->0.99, p3 = 0.1
f = figure("Name", "Compound Network Link: p1 = 0.6, p2 = 0.01->0.99, p3 = 0.1");
axes;
hold all;

% Iterates through each probability from 0.01 to 0.99
for x = 0:99
    buildGraph(0.6, x ./ 100, 0.1, x ./ 100);
end

% Figure 5: p1 = 0.01->0.99, p2 = 0.1, p3 = 0.6
f = figure("Name", "Compound Network Link: p1 = 0.01->0.99, p2 = 0.1, p3 = 0.6");
axes;
hold all;

% Iterates through each probability from 0.01 to 0.99
for x = 0:99
    buildGraph(x ./ 100, 0.1, 0.6, x ./ 100);
end

% Figure 6: p1 = 0.01->0.99, p2 = 0.6, p3 = 0.1
f = figure("Name", "Compound Network Link: p1 = 0.01->0.99, p2 = 0.6, p3 = 0.1");
axes;
hold all;

% Iterates through each probability from 0.01 to 0.99
for x = 0:99
    buildGraph(x ./ 100, 0.6, 0.1, x ./ 100);
end

%--------------------------------------------------------------------------

% buildGraph(x1, x2, x3, x) - Plots the points on the graphs depending on
%                               the variables
%   x1 - The probability of failure for the first link
%   x2 - The probability of failure for the second link
%   x3 - The probability of failure for the third link
%   x - The current probability x to plot on graph
% return - None, plots the points on the graph
function buildGraph(x1, x2, x3, x)
    for k = [1, 5, 10]
        % Calls the function to get the number of transmissions
        y = runCustomCompoundNetworkSim(k, x1, x2, x3, 1000);
        % Plots the circle in a different color depending on k
        if k == 1
            plot(x, y, "o", "Color", [0 1 0]);
        elseif k == 5
            plot(x, y, "o", "Color", [1 0 0]);
        else
            plot(x, y, "-o", "Color", [0 0 1]);
        end
    end

    yscale("log");
end