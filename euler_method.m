 % For the course, you will all have access to the latest version of the
 % MATLAB programming software for use in data acquisition and analysis.
 % While we will spend most of the time blazing through syntax and
 % explaining some of the math behind the programming we will be doing,
 % none of this will be totally unique.
 
 % MATLAB is a high-level programming language capable of doing a wide
 % variety of computational tasks. One of those tasks is performing simple
 % arithmetic operations. 
 
 % Addition 
 2 + 2  
 4 + 5
 10 + 12 
 
 % All of these should print out the result. However, this will very
 % rapidly become annoying when we are performing many long computations.
 % To prevent MATLAB from automatically spitting out an answer, we can
 % simply add a semicolon to every evaluation we perform. 
 2 / 8;
 7^4; 
 100 * 5; % All will be silent. 
 
 % Of course, we will never want to just perform a calculation without
 % storing the output. To do so, we want to assign a value to a variable,
 % which we do with the equals sign. 
 a = 1;
 b = 2; 
 z = a / b;
 
 % We can also set up lists and matrices and assign them to variables. At
 % it's core, MATLAB treats everything as a matrix. We can use these
 % matrices to generate objects in which we will store values. For example,
 % 
 b = [1, 2, 4, 6, 7];  % This is a list. 
 c = [0:4:20];  % A list starting from 0 going to 20 taking steps of 4.
 
 
 % We can even make multidimensional matrices. 
 d = [1, 2, 3; 10, 15, 100;, 1000, 1E2, 1E-1];
 
 % To index these numbers, we can just use a set of parenthsesis. Let's get
 % the first value in our 'b' matrix. 
 b(1)   % In Matlab, indexing starts at 1. 
 
 % Two dimensional matrices can be sliced in similar ways. 
 d(1, 2)  % This will be first row, second column (2).
 
 % Now that we havae a feeling for the syntax, let's try performing the
 % numerical integration. As we worked out on the board, we want to keep
 % track of a cell which grows at a rate r and doesn't die. We will start
 % by defining some of our parameters.  
 N1 =