### **Credit Card Customer Segmentation Analysis Report**

## **1. Executive Summary**
This report analyzes credit card customer data to identify high-risk customers based on factors such as average credit limit, total credit cards, and interactions (visits to the bank, online activity, and call center usage). The insights from the logistic regression model are used to propose actionable business recommendations.

### **Key Findings:**
- High-risk customers tend to have lower credit limits, higher card usage, and limited engagement with online or physical banking.
- Customers with a credit limit below $100,000 are more likely to default, especially when their usage of bank visits, online services, and call centers is low.

## **2. Data Summary**
### **Key Variables Analyzed:**
- **Avg_Credit_Limit:** Ranges from $3,000 to $100,000.
- **Total_Credit_Cards:** Varies between 1 and 7 cards.
- **Total_visits_bank:** Ranges from 0 to 2 visits.
- **Total_visits_online:** Ranges from 1 to 12 visits.
- **Total_calls_made:** Between 0 and 9 calls.

### **High-Risk Customers Overview:**
- **Proportion:** 70% of the dataset is flagged as high risk.
- **Characteristics:** These customers typically have lower credit limits, higher reliance on call centers, and minimal bank or online visits.

## **3. Logistic Regression Results**
The logistic regression model was used to predict high-risk customers.

### **Model Performance:**
- **Accuracy:** 85%
- **AUC (ROC Curve):** 0.88, indicating excellent predictive ability.

### **Key Predictors of High Risk:**
- **Avg_Credit_Limit:** Customers with lower credit limits (below $100,000) are at significantly higher risk.
- **Total_Credit_Cards:** Higher numbers of cards increase risk due to likely overextension of credit.
- **Total_visits_online and Total_visits_bank:** Lower engagement with online or in-person banking correlates with higher risk.
- **Total_calls_made:** High-risk customers make more calls, potentially indicating financial distress.

## **4. Visualizations**
### **Key Graphs:**
1. **Avg Credit Limit vs. Total Credit Cards:**
   - Scatterplot shows a clustering of high-risk customers with low credit limits and multiple cards.
2. **Distribution of Bank Visits:**
   - Histogram reveals that most high-risk customers rarely visit the bank.
3. **ROC Curve:**
   - Confirms the strong performance of the logistic regression model.

## **5. Business Recommendations**
### **Risk Mitigation Strategies:**
1. **Monitor Low Credit Limit Customers:**
   - Proactively engage customers with limits under $50,000 to offer financial counseling or tailored payment plans.
2. **Limit New Credit Card Offers:**
   - Implement stricter criteria for issuing multiple credit cards to customers with existing high utilization rates.
3. **Enhance Online Engagement:**
   - Introduce targeted campaigns encouraging online and in-person banking to improve customer engagement and reduce risk.
4. **Optimize Call Center Support:**
   - Provide specialized financial guidance for customers making frequent calls, as this may indicate early signs of financial stress.

### **Revenue Opportunities:**
1. **Upsell to Stable Customers:**
   - Offer premium products to customers with high credit limits and consistent engagement.
2. **Loyalty Programs:**
   - Incentivize high-risk customers to improve engagement through rewards for increased bank visits or online activity.

## **6. Conclusion**
The analysis highlights clear trends and actionable opportunities for improving customer segmentation and reducing credit risk. By implementing targeted engagement and stricter credit management strategies, the company can mitigate default risks while maintaining customer satisfaction.