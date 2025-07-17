clc, clear, close all

prob = optimproblem('ObjectiveSense','max');
x = optimvar('x',5,1,'LowerBound',0);

% 目标函数系数向量（净收益率）
c = [0.05,0.27,0.19,0.185,0.185];

% 资产配置等式约束矩阵
Aeq = [1,1.01,1.02,1.045,1.065];

% 设置目标函数
prob.Objective = c * x;

% 设置总投资金额
M = 10000;

% 添加资产配置等式约束
prob.Constraints.con1 = Aeq * x == M;

% 风险损失率系数向量
q = [0.025,0.015,0.055,0.026]';

% 初始化结果存储数组
a = 0; aa = []; QQ = []; XX = []; hold on

% 循环求解不同风险偏好下的最优解
while a < 0.05
    prob.Constraints.con2 = q.* x(2:end) <= a * M;
    [sol,Q,flag,out] = solve(prob);
    aa = [aa, a];
    QQ = [QQ;Q];
    XX = [XX; sol.x'];
    a = a + 0.001;
end

% 绘制风险偏好与最优收益关系图
plot(aa, QQ, '*k')
xlabel('$\alpha$','Interpreter','Latex')
ylabel('$Q$','Interpreter','Latex','Rotation',0) 