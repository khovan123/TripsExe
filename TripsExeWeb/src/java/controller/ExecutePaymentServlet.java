package Controller;

import Model.PaymentServices;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.ShippingAddress;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.PayPalRESTException;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "ExecutePaymentServlet", urlPatterns = {"/execute_payment"})
public class ExecutePaymentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String paymentId = request.getParameter("paymentId");
            String payerId = request.getParameter("PayerID");

            PaymentServices paymentServices = new PaymentServices();
            Payment payment = paymentServices.executePayment(paymentId, payerId);
            
            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
            Transaction transaction = payment.getTransactions().get(0);
            
            request.setAttribute("payer", payerInfo);
            request.setAttribute("transaction", transaction);
            
            request.getRequestDispatcher("/payments/Receipt.jsp").forward(request, response);
        } catch (PayPalRESTException ex) {
            request.setAttribute("errorMsg", ex.getMessage());
            request.getRequestDispatcher("/pages/ErrorPage.jsp").forward(request, response);
        }
    }

}
