	
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

	function [ c, ceq ] = mycon( x ) %��Ҫ���������������c����������������С��0��
	c = [getResult3(x, 25, 80) - 44; getResult3(x, 30, 80) - 47];
	%�����¶ȵ�����30�����¶ȳ���44�Ȳ�����5���ӣ��ȼ���25����ʱ�¶Ȳ�����44��
	ceq = [];
	end

	function [x] = fun(x)
	x = x;
	end

