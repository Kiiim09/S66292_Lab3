<%-- 
    Document   : Calculator
    Created on : 17 Apr 2024, 3:20:01 pm
    Author     : Luqman Hakim Bin Aziz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Car Loan Result</title>
</head>
<body>
    <h1>Perform Car Loan Calculator</h1>
     <fieldset>
    <%
        String loanAmountStr = request.getParameter("loanAmount");
        String loanPeriodStr = request.getParameter("loanPeriod");
        
        int loanAmount = Integer.parseInt(loanAmountStr);
        int loanPeriod = Integer.parseInt(loanPeriodStr);

        double annualInterestRate;
        if (loanPeriod < 5) {
            annualInterestRate = 0.028; // 2.8% annual interest rate for loan period less than 5 years
        } else {
            annualInterestRate = 0.045; // 4.5% annual interest rate for loan period 5 years or more
        }
        
        double monthlyInterestRate = annualInterestRate / 12;
        int totalMonths = loanPeriod * 12;
        
        double monthlyPayment = (loanAmount * monthlyInterestRate) / (1 - Math.pow(1 + monthlyInterestRate, -totalMonths));

        double totalLoan = monthlyPayment * totalMonths;
        
    %>
    <h2>Details Of Car Loan</h2>
    <p>Loan Amount: RM <%= loanAmount %></p>
    <p>Loan Period: <%= loanPeriod %> years</p>
    <p>Annual Interest Rate: <%= annualInterestRate * 100 %>%</p>
    <p>Monthly Payment: RM <%= String.format("%.2f", monthlyPayment) %></p>
    <p>Total Loan (+interest): RM <%= String.format("%.2f", totalLoan) %></p>
     </fieldset>
</body>
</html>
