clc , clear

r = [0.05, 0.28, 0.21, 0.23, 0.25];%收益
q = [0, 0.025, 0.015, 0.055, 0.026]'; %风险
p = [0, 0.01, 0.02, 0.045, 0.065];%费用
M = 10000;

prob = optimproblem;
x = optimvar('x',6,1,'LowerBound',0);

prob.Objective = x(end);

prob.Constraints.con1 = q(2:end) .* x(2:end - 1) <= x(end);
prob.Constraints.con2 = (1 + p) * x(1:end-1) == M;

X = [];%最优解
V = [];%风险

k = 0.1:0.005:0.5;

for i = 1:length(k)
    prob.Constraints.con3 = (r - p) * x(1:end - 1) >= k(i)*M;
    [sol, fval, flag, out] = solve(prob);
    xx = sol.x;
    V = [V, max(q .* xx(1:end-1))];
    X = [X;xx'];
    plot(k,V,'*k')
    xlabel('收益率')
    ylabel('风险')
end




