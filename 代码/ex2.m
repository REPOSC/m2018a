	
	function main
	x = 25e-3;
	A=[];
	b=[];
	Aeq=[];
	beq=[];
	%x�����½�
	lb = [0.6e-3];
	ub = [25e-3];
	[x,~,~] = fmincon(@fun,x,A,b,Aeq,beq,lb,ub,@mycon);
	x
	end

	function [ c, ceq ] = mycon( x ) %��Ҫ���������������c����������������С��0��
	c = [getResult2(x, 55, 65) - 44; getResult2(x, 60, 65) - 47]; %�����¶ȵ�����60�����¶ȳ���44�Ȳ�����5���ӣ��ȼ���55����ʱ�¶Ȳ�����44��
	ceq = [];
	end

	function [x] = fun(x) %��Ҫ�Ż��ĺ������Ż�xʹ��x��С��
	x = x;
	end

