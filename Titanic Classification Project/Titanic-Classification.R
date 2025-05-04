
setwd("/Users/sailikhiths/Documents/College Course Files/Data101 - Spring 2025")


titanic <- read.csv("Titanic-Dataset.csv", stringsAsFactors = TRUE)
head(titanic)
str(titanic)

titanic <- titanic[, c("Survived", "Pclass", "Sex", "Age", "SibSp", "Parch", "Fare", "Embarked")]
titanic$Age[is.na(titanic$Age)] <- median(titanic$Age, na.rm = TRUE)
titanic <- titanic[!is.na(titanic$Embarked), ]

titanic$Survived <- as.factor(titanic$Survived)
titanic$Pclass <- as.factor(titanic$Pclass)
titanic$Sex <- as.factor(titanic$Sex)
titanic$Embarked <- as.factor(titanic$Embarked)

set.seed(42)
split <- sample(1:nrow(titanic), 0.7 * nrow(titanic))
train <- titanic[split, ]
test <- titanic[-split, ]

library(rpart)
library(rpart.plot)
tree_model <- rpart(Survived ~ ., data=train, method="class")
rpart.plot(tree_model)
pred_tree <- predict(tree_model, test, type="class")
conf_matrix_tree <- table(Predicted = pred_tree, Actual = test$Survived)
print(conf_matrix_tree)

library(e1071)
nb_model <- naiveBayes(Survived ~ ., data=train)
pred_nb <- predict(nb_model, test)
conf_matrix_nb <- table(Predicted = pred_nb, Actual = test$Survived)
print(conf_matrix_nb)

acc_tree <- mean(pred_tree == test$Survived)
acc_nb <- mean(pred_nb == test$Survived)
print(paste("Decision Tree Accuracy:", acc_tree))
print(paste("Naive Bayes Accuracy:", acc_nb))
