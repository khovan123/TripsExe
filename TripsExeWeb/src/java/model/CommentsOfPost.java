package model;

import exception.*;
import java.util.*;
import java.util.function.*;

public class CommentsOfPost {

    private List<String> commentIds = new ArrayList<>();

    public String search(Predicate<String> p) throws NotFoundException {
        for (String id : commentIds) {
            if (p.test(id)) {
                return id;
            }
        }
        throw new NotFoundException("Can not found!");
    }

    public void addComment(String commentId) throws AddException {
        try {
            this.search(p -> p.equalsIgnoreCase(commentId));
            this.commentIds.add(commentId);
        } catch (NotFoundException e) {
            throw new AddException("Add post failed!");
        }
    }

    public void setCommentIdsFromDB() {

    }

    public List<Comment> getCommentIn4FromDB() {
        return null;
    }
}
