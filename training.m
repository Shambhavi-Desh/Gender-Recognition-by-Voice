table = readtable('features.xls');  %create table from file : training set
predictor = table(:,2:end-1);   
%extract entries from column 2 to second last as they are the extracted features
response = table(:,end);    
%the correct classification is extracted from the table and stored in 'response'

testTable = readtable('testingData.xls');   %create table from file : testing set
testFeatures = testTable(:,2:end-1);
testoutput = table2array(testTable(:,end));

mdl = fitcknn(predictor,response,'NumNeighbors',4);     
% train KNN classification model(N = 4)on the data from training dataset
prediction = predict(mdl,testFeatures);     
% predict the testing dataset's gender using the trained model
n = numel(prediction);      % find number of array elements 
p = 0;	%represents predictions that were correct
for k = 1:n
    a = strcmp(char(prediction(k,1)),char(testoutput(k,1)));    
    % compare predicted output with actual answer  
    if a == 1
        p = p+1;    %calculate number of correct predictions
    end
end
efficiency  = (p/n)*100;    %calculate efficiency of the model on the dataset
disp('Efficiency of knn model is : ')
disp(efficiency);





