	
	function main
	x = 25e-3;
	A=[];
	b=[];
	Aeq=[];
	beq=[];
	lb = [0.6e-3];
	ub = [25e-3];
	[x,~,~] = fmincon(@fun,x,A,b,Aeq,beq,lb,ub,@mycon);
	x
	end

	function [ c, ceq ] = mycon( x ) %需要满足的条件（满足c向量的两个分量都小于0）
	c = [getResult3(x, 25, 80) - 44; getResult3(x, 30, 80) - 47];
	%由于温度单增，30分钟温度超过44度不超过5分钟，等价于25分钟时温度不超过44度
	ceq = [];
	end

	function [x] = fun(x)
	x = x;
	end

