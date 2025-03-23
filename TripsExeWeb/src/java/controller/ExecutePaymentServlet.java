package controller;

import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.PayPalRESTException;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ExecutePaymentServlet", urlPatterns = {"/execute_payment"})
public class ExecutePaymentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    String paymentId = request.getParameter("paymentId");
    String payerId = request.getParameter("PayerID");

    if (paymentId == null || payerId == null || paymentId.trim().isEmpty() || payerId.trim().isEmpty()) {
        request.setAttribute("error", "Missing payment ID or payer ID.");
        request.getRequestDispatcher("/pages/ErrorPage.jsp").forward(request, response);
        return;
    }

    try {
        PayPalService payPalService = new PayPalService();

        Payment payment = payPalService.getPaymentDetails(paymentId); 
        String paymentState = payment.getState();

        if ("approved".equalsIgnoreCase(paymentState)) {
            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
            Transaction transaction = payment.getTransactions().get(0);

            request.setAttribute("payer", payerInfo);
            request.setAttribute("transaction", transaction);
            request.getRequestDispatcher("/payments/Receipt.jsp").forward(request, response);
            return;
        }

        payment = payPalService.executePayment(paymentId, payerId);

        PayerInfo payerInfo = payment.getPayer().getPayerInfo();
        Transaction transaction = payment.getTransactions().get(0);

        request.setAttribute("payer", payerInfo);
        request.setAttribute("transaction", transaction);

        request.getRequestDispatcher("/payments/Receipt.jsp").forward(request, response);
    } catch (PayPalRESTException ex) {
        request.setAttribute("error", "Payment execution failed: " + ex.getMessage());
        request.getRequestDispatcher("/pages/ErrorPage.jsp").forward(request, response);
    }
}

}
