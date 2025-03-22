package websocket;

import com.fasterxml.jackson.databind.ObjectMapper;
import model.Comment;

public class TestJackson {

    public static void main(String[] args) throws Exception {
        ObjectMapper mapper = new ObjectMapper();
        Comment cmt = new Comment();
        cmt.setText("Test comment");
        cmt.setFullName("Test User");
        cmt.setUserId(1);
        cmt.setPostId(1);

        String json = mapper.writeValueAsString(cmt);
        System.out.println("JSON: " + json);

        Comment deserialized = mapper.readValue(json, Comment.class);
        System.out.println("Deserialized: " + deserialized.getText());
    }
}
