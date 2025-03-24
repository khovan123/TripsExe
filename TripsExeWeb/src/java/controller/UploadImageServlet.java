package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.security.GeneralSecurityException;
import service.UploadImageService;

@WebServlet(urlPatterns = {"/uploadToGoogleDrive"})
@MultipartConfig
public class UploadImageServlet extends HttpServlet {
    
    private UploadImageService service = new UploadImageService();
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        Part filePart = req.getPart("image");
        
        if (filePart == null || filePart.getSize() == 0) {
            resp.getWriter().write("File is empty");
            return;
        }
        File tempFile = File.createTempFile("temp", null);
        try {
            filePart.write(tempFile.getAbsolutePath());
            
            String url = service.uploadImageToDrive(tempFile);
            session.setAttribute("imageUploadUrl", url);
            
            String where = (String) req.getAttribute("where");
            if(where.equalsIgnoreCase("home-post")){
                
            }else if(where.equalsIgnoreCase("profile-post")){
                
            }else if(where.equalsIgnoreCase("home-comment")){
                
            }else if(where.equalsIgnoreCase("profile-comment")){
                
            }else if(where.equalsIgnoreCase("chat")){
                
            }
            resp.sendRedirect("index.jsp");
        } catch (IOException | GeneralSecurityException e) {
            throw new ServletException(e);
        } finally {
            tempFile.delete();
        }
    }    
    
}
