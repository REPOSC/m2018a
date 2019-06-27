	
	function [result] = getResult(h1, h2)
	%初始化
	p = [300, 862, 74.2, 1.18];
	c = [1377, 2100, 1726, 1005];
	lbd = [0.082, 0.37, 0.045, 0.028];
	len = [0.6e-3, 6e-3, 3.6e-3, 5e-3];
	teps = 1e-2;
	xeps = [0.0001,0.0001,0.0006,0.001];
	Tenv = 75;
	Tbody = 37;
	len = len./xeps;
	len = round([sum(len(1:1)), sum(len(1:2)), sum(len(1:3)), sum(len(1:4))]);
	maxt = round(90*60/teps);
	T = zeros(maxt, len(4));
	T(1, :) = 37;
	%时间片迭代
	for n = 1:maxt - 1
		%第二个方程
		T(n + 1, 1) = (-h1 * (T(n, 1) - Tenv) - lbd(1) * (T(n, 1) - T(n, 2)) / xeps(1)) * teps * 2 / xeps(1) / p(1) / c(1) + T(n, 1);    
		for i = 2:len(1) - 1
			T(n + 1, i) = lbd(1) * (T(n, i + 1) - 2 * T(n, i) + T(n, i - 1)) / xeps(1) / xeps(1) / p(1) / c(1) * teps + T(n, i); %第一个方程
		end
		%第四个方程
		i = len(1); T(n + 1, i) = (lbd(1) * (T(n, i - 1) - T(n, i)) / xeps(1) + lbd(2) * (T(n, i + 1) - T(n, i)) / xeps(2)) * 2 * teps / (xeps(1) * p(1) * c(1) + xeps(2) * p(2) * c(2)) + T(n, i);    
		for i = len(1) + 1:len(2) - 1
			T(n + 1, i) = lbd(2) * (T(n, i + 1) - 2 * T(n, i) + T(n, i - 1)) / xeps(2) / xeps(2) / p(2) / c(2) * teps + T(n, i); %第一个方程
		end
		%第四个方程
		i = len(2); T(n + 1, i) = (lbd(2) * (T(n, i - 1) - T(n, i)) / xeps(2) + lbd(3) * (T(n, i + 1) - T(n, i)) / xeps(3)) * 2 * teps / (xeps(2) * p(2) * c(2) + xeps(3) * p(3) * c(3)) + T(n, i);    
		for i = len(2) + 1:len(3) - 1        
			T(n + 1, i) = lbd(3) * (T(n, i + 1) - 2 * T(n, i) + T(n, i - 1)) / xeps(3) / xeps(3) / p(3) / c(3) * teps + T(n, i); %第一个方程
		end
		%第四个方程
		i = len(3); T(n + 1, i) = (lbd(3) * (T(n, i - 1) - T(n, i)) / xeps(3) + lbd(4) * (T(n, i + 1) - T(n, i)) / xeps(4)) * 2 * teps / (xeps(3) * p(3) * c(3) + xeps(4) * p(4) * c(4)) + T(n, i);    
		for i = len(3) + 1:len(4) - 1        
			T(n + 1, i) = lbd(4) * (T(n, i + 1) - 2 * T(n, i) + T(n, i - 1)) / xeps(4) / xeps(4) / p(4) / c(4) * teps + T(n, i); %第一个方程
		end
		%第三个方程
		i = len(4); T(n + 1, i) = (-h2 * (T(n, i) - Tbody) + lbd(4) * (T(n, i - 1) - T(n, i)) / xeps(4)) * teps * 2 / xeps(4) / p(4) / c(4) + T(n, i);
	end
	%绘图
	hold on
	result = T(1:1/teps:end,end);
	plot(result)
	readfile = xlsread('data.xlsx','附件2','b3:b5403'); %与给出的文件对比
	plot(readfile)

