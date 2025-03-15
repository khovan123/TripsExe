package controller;

import CRUD.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/SaveAccountSetting")
public class SaveAccountSettingServlet extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        try {
            userDAO = new UserDAO();
        } catch (Exception e) {
            throw new ServletException("Failed to initialize UserDAO", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userId = getUserIdFromCookie(request);
        if (userId == null) {
            response.sendRedirect("signInPage.jsp");
            return;
        }

        try {
            User user = userDAO.getUserById(Integer.parseInt(userId));
            if (user == null) {
                response.sendRedirect("signInPage.jsp");
                return;
            }
            request.setAttribute("user", user);

            String fullName = user.getFullName() != null ? user.getFullName() : "";
            String[] nameParts = fullName.split(" ", 2);
            String firstName = nameParts.length > 0 ? nameParts[0] : "";
            String lastName = nameParts.length > 1 ? nameParts[1] : "";
            request.setAttribute("firstName", firstName);
            request.setAttribute("lastName", lastName);

            if (user.getDob() != null) {
                SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
                String formattedDob = dateFormat.format(user.getDob());
                request.setAttribute("formattedDob", formattedDob);
            } else {
                request.setAttribute("formattedDob", "");
            }

            request.getRequestDispatcher("/AccountSection.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(SaveAccountSettingServlet.class.getName()).log(Level.SEVERE, "Database error", ex);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error occurred.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userId = getUserIdFromCookie(request);

        if (userId == null) {
            request.setAttribute("errorMsg", "User session not found. Please log in again.");
            request.getRequestDispatcher("pages/ErrorPage.jsp").forward(request, response);
            return;
        }

        String firstName = trimParam(request.getParameter("firstName"));
        String lastName = trimParam(request.getParameter("lastName"));
        String additionalName = trimParam(request.getParameter("additionalName"));
        String username = trimParam(request.getParameter("username"));
        String dob = trimParam(request.getParameter("dob"));
        String phoneNumber = trimParam(request.getParameter("phoneNumber"));
        String email = trimParam(request.getParameter("email"));
        String overview = trimParam(request.getParameter("overview"));
        String allowTeam = request.getParameter("allowTeam");

        String validationError = validateUserInput(firstName, lastName, username, dob, additionalName, phoneNumber, email, overview);
        if (validationError != null) {
            request.setAttribute("errorMsg", validationError);
            request.getRequestDispatcher("pages/ErrorPage.jsp").forward(request, response);
            return;
        }

        try {
            User user = userDAO.getUserById(Integer.parseInt(userId));
            if (user == null) {
                request.setAttribute("errorMsg", "User not found in database.");
                request.getRequestDispatcher("pages/ErrorPage.jsp").forward(request, response);
                return;
            }

            user.setFullName(firstName + " " + lastName);
            user.setAdditionalName(additionalName);
            user.setUsername(username);
            user.setEmail(email);
            user.setPhoneNumber(phoneNumber);
            user.setOverview(overview);

            if (dob != null && !dob.isEmpty()) {
                SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
                java.util.Date utilDate = dateFormat.parse(dob);
                user.setDob(new java.sql.Date(utilDate.getTime()));
            }

            userDAO.updateUser(user);

            request.setAttribute("successMsg", "Account settings updated successfully!");
            request.getRequestDispatcher("pages/SettingPage.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(SaveAccountSettingServlet.class.getName()).log(Level.SEVERE, "Database error", ex);
            request.setAttribute("errorMsg", "Database error: " + ex.getMessage());
            request.getRequestDispatcher("pages/ErrorPage.jsp").forward(request, response);
        } catch (NumberFormatException ex) {
            Logger.getLogger(SaveAccountSettingServlet.class.getName()).log(Level.SEVERE, "Invalid user ID", ex);
            request.setAttribute("errorMsg", "Invalid user session.");
            request.getRequestDispatcher("pages/ErrorPage.jsp").forward(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(SaveAccountSettingServlet.class.getName()).log(Level.SEVERE, "Invalid date format", ex);
            request.setAttribute("errorMsg", "Invalid date format. Use dd/MM/yyyy.");
            request.getRequestDispatcher("pages/ErrorPage.jsp").forward(request, response);
        }
    }

    private String validateUserInput(String firstName, String lastName, String username, String dob, String additionalName,
            String phoneNumber, String email, String overview) {
        if (isEmpty(firstName)) {
            return "Please enter your first name";
        }
        if (isEmpty(lastName)) {
            return "Please enter your last name.";
        }
        if (isEmpty(username)) {
            return "Please enter your username.";
        }
        if (isEmpty(email) || !email.matches("^[\\w!#$%&'*+/=?`{|}~^.-]+@[A-Za-z0-9.-]+$")) {
            return "Please enter a valid email.";
        }
        if (phoneNumber != null && !phoneNumber.isEmpty() && !phoneNumber.matches("^\\d{10}$")) {
            return "Phone number must be exactly 10 digits.";
        }
        if (dob != null && !dob.isEmpty()) {
            try {
                SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
                dateFormat.setLenient(false);
                dateFormat.parse(dob);
            } catch (ParseException e) {
                return "Invalid date format. Use dd/MM/yyyy.";
            }
        }
        if (overview != null && overview.length() > 300) {
            return "Overview cannot exceed 300 characters.";
        }
        return null;
    }

    private String getUserIdFromCookie(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("userId".equals(cookie.getName())) {
                    return cookie.getValue();
                }
            }
        }
        return null;
    }

    private String trimParam(String param) {
        return param != null ? param.trim() : null;
    }

    private boolean isEmpty(String str) {
        return str == null || str.isEmpty();
    }
}