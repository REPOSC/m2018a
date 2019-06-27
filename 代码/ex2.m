	
	function main
	x = 25e-3;
	A=[];
	b=[];
	Aeq=[];
	beq=[];
	%x的上下界
	lb = [0.6e-3];
	ub = [25e-3];
	[x,~,~] = fmincon(@fun,x,A,b,Aeq,beq,lb,ub,@mycon);
	x
	end

	function [ c, ceq ] = mycon( x ) %需要满足的条件（满足c向量的两个分量都小于0）
	c = [getResult2(x, 55, 65) - 44; getResult2(x, 60, 65) - 47]; %由于温度单增，60分钟温度超过44度不超过5分钟，等价于55分钟时温度不超过44度
	ceq = [];
	end

	function [x] = fun(x) %需要优化的函数（优化x使得x最小）
	x = x;
	end

