package service;

import com.google.api.client.googleapis.auth.oauth2.GoogleCredential;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.FileContent;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.gson.GsonFactory;
import com.google.api.services.drive.Drive;
import com.google.api.services.drive.DriveScopes;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.GeneralSecurityException;
import java.util.Collections;

public class UploadImageService {

    private static final JsonFactory JSON_FACTORY = GsonFactory.getDefaultInstance();
    private static final String SERVICE_ACCOUNT_KEY_PATH = getPathToGoogleCredentials();

    private static String getPathToGoogleCredentials() {
        Path filePath = Paths.get("D:\\Codes\\JAVAWEB\\Project\\TripsExe\\TripsExeWeb\\src", "cred.json");
        return filePath.toString();
    }

    public String uploadImageToDrive(File file) throws GeneralSecurityException, IOException {
        try {
            String folderId = "1sSYxLQ4COcmVct_LksIU75fk79oQYbZI";
            Drive drive = createDriveService();
            com.google.api.services.drive.model.File fileMetaData = new com.google.api.services.drive.model.File();
            fileMetaData.setName(file.getName());
            fileMetaData.setParents(Collections.singletonList(folderId));
            FileContent mediaContent = new FileContent("image/jpeg", file);
            com.google.api.services.drive.model.File uploadedFile = drive.files().create(fileMetaData, mediaContent).setFields("id").execute();
            com.google.api.services.drive.model.Permission permission = new com.google.api.services.drive.model.Permission();
            permission.setType("anyone");
            permission.setRole("reader");
            drive.permissions().create(uploadedFile.getId(), permission).execute();
//            String imageUrl = "http://drive.google.com/thumbnail?id=" + uploadedFile.getId();
            String imageUrl = "https://lh3.google.com/u/0/d/" + uploadedFile.getId();
            file.delete();
            return imageUrl;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    private Drive createDriveService() throws FileNotFoundException, GeneralSecurityException, IOException {
        GoogleCredential credential = GoogleCredential.fromStream(new FileInputStream(SERVICE_ACCOUNT_KEY_PATH)).createScoped(Collections.singleton(DriveScopes.DRIVE));
        return new Drive.Builder(
                GoogleNetHttpTransport.newTrustedTransport(),
                JSON_FACTORY, credential
        ).build();
    }
}
