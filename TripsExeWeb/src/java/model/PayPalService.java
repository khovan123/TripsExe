package model;

import com.paypal.api.payments.Amount;
import com.paypal.api.payments.Details;
import com.paypal.api.payments.Item;
import com.paypal.api.payments.ItemList;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.PaymentExecution;
import com.paypal.api.payments.RedirectUrls;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;
import java.util.ArrayList;
import java.util.List;

public class PayPalService {
    private static final String CLIENT_ID = "AUWNvCBJdnrY3SvqLh_b5debZif7oi_tP6YdNoW6pNyjBzcu-3IAVD9Mbp1nKTMXGqY-UyWvYhaww8Ei";
    private static final String CLIENT_SECRET = "EJXjIO0B_DT3MLHmXXKYOkO_0zaYUSwJup9nJmz0CCpWw70FiQo9DX4522QVm3miGFK4q1E57yJQDHve";
    private static final String MODE = "sandbox";
    private static final APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);

    public String authorizePayment(User user, double amount, String description) throws PayPalRESTException {
        Payer payer = getPayerInformation(user);
        RedirectUrls redirectUrls = getRedirectURLs();
        List<Transaction> transactionList = getTransactionInformation(amount, description);

        Payment requestPayment = new Payment();
        requestPayment.setTransactions(transactionList)
                .setRedirectUrls(redirectUrls)
                .setPayer(payer)
                .setIntent("authorize");

        Payment approvePayment = requestPayment.create(apiContext);
        return getApproveLink(approvePayment);
    }

    private String getApproveLink(Payment approvePayment) throws PayPalRESTException {
        List<Links> links = approvePayment.getLinks();
        for (Links link : links) {
            if (link.getRel().equalsIgnoreCase("approval_url")) {
                return link.getHref();
            }
        }
        throw new PayPalRESTException("Approval URL not found in PayPal response");
    }

    private List<Transaction> getTransactionInformation(double amount, String description) {
        // Khai báo Amount và Details
        Amount transactionAmount = new Amount();
        transactionAmount.setCurrency("USD");
        transactionAmount.setTotal(String.format("%.2f", amount)); // Tổng 27.00

        Details details = new Details();
        details.setSubtotal(String.format("%.2f", 24.00)); // Giá gói
        details.setTax(String.format("%.2f", 3.00)); // Phí xử lý (Handling Fee)
        transactionAmount.setDetails(details);

        ItemList itemList = new ItemList();
        List<Item> items = new ArrayList<>();

        Item premiumPackage = new Item();
        premiumPackage.setCurrency("USD")
                .setName("Social - Network & Comm...")
                .setPrice(String.format("%.2f", 24.00)) // Giá gói
                .setQuantity("1");
        items.add(premiumPackage);
        itemList.setItems(items);

        Transaction transaction = new Transaction();
        transaction.setAmount(transactionAmount);
        transaction.setDescription(description);
        transaction.setItemList(itemList);

        List<Transaction> transactionList = new ArrayList<>();
        transactionList.add(transaction);
        return transactionList;
    }

    private RedirectUrls getRedirectURLs() {
        RedirectUrls redirectUrls = new RedirectUrls();
        redirectUrls.setCancelUrl("http://localhost:9999/TripsExeWeb/payments/CancelPayment.jsp");
        redirectUrls.setReturnUrl("http://localhost:9999/TripsExeWeb/review_payment");
        return redirectUrls;
    }

    private Payer getPayerInformation(User user) {
        Payer payer = new Payer();
        payer.setPaymentMethod("paypal");

        PayerInfo payerInfo = new PayerInfo();
        payerInfo.setEmail(user.getEmail());
        if (user.getFullName() != null) {
            String[] nameParts = user.getFullName().split(" ", 2);
            payerInfo.setFirstName(nameParts[0]);
            if (nameParts.length > 1) {
                payerInfo.setLastName(nameParts[1]);
            }
        }
        payer.setPayerInfo(payerInfo);
        return payer;
    }

    public Payment getPaymentDetails(String paymentId) throws PayPalRESTException {
        return Payment.get(apiContext, paymentId);
    }

    public Payment executePayment(String paymentId, String PayerID) throws PayPalRESTException {
        PaymentExecution paymentExecution = new PaymentExecution();
        paymentExecution.setPayerId(PayerID);

        Payment payment = new Payment().setId(paymentId);
        return payment.execute(apiContext, paymentExecution);
    }
}