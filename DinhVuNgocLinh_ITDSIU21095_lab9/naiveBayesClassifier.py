import pandas as pd
import numpy as np
import sys
from collections import Counter

class NaiveBayesFilter:
    def __init__(self):
        self.data = []
        self.vocabulary = []  # returns tuple of unique words
        self.p_spam = 0  # Probability of Spam
        self.p_ham = 0  # Probability of Ham
        # Initiate parameters
        self.parameters_spam = {unique_word: 0 for unique_word in self.vocabulary}
        print('parameters_spam: ', self.parameters_spam)
        self.parameters_ham = {unique_word: 0 for unique_word in self.vocabulary}
        print('parameters_ham: ', self.parameters_spam)

    def fit(self, X, y):
        "*** YOUR CODE HERE ***"
        word_counts = []
        for message in X:
            count = Counter(message.split())
            word_counts.append(count)

        df = pd.DataFrame(word_counts)
        df['Label'] = y

        self.data = df
        return self.data

    def predict(self, X):
        prob = []
        "*** YOUR CODE HERE ***"
        for message in X:
            p_spam_given_message = self.calculate_proba(message, 'spam')
            p_ham_given_message = self.calculate_proba(message, 'ham')

            if p_spam_given_message > p_ham_given_message:
                prob.append('spam')
            else:
                prob.append('ham')

        return prob

    def predict_proba(self, X):
        proba = []
        "*** YOUR CODE HERE ***"
        for message in X:
            p_spam_given_message = self.calculate_probability(message, 'spam')
            p_ham_given_message = self.calculate_probability(message, 'ham')

            proba.append([p_ham_given_message, p_spam_given_message])

        return proba

    def score(self, true_labels, predict_labels):
        "*** YOUR CODE HERE ***"
        true_positives = 0
        actual_positives = 0
        for true, pred in zip(true_labels, predict_labels):
             if true == 'spam':
                actual_positives += 1

                if pred == 'spam':
                    true_positives += 1
        
        recall = true_positives/ actual_positives        
        return recall
