myData = read.csv("D:/Projects/EM-algorithm/Iris.csv", header = TRUE, sep = ",") 
print(summary(myData))

plot(density(myData$SepalLengthCm))