package model;

import exception.*;
import java.util.*;
import java.util.function.Predicate;

public class PostsOfUser {

    private List<String> postIds = new ArrayList<>();

    public List<String> getPostIds() {
        return this.postIds;
    }

    public String search(Predicate<String> p) throws NotFoundException {
        for (String id : postIds) {
            if (p.test(id)) {
                return id;
            }
        }
        throw new NotFoundException("Can not found!");
    }

    public void addPost(String postId) throws AddException {
        try {
            this.search(p -> p.equalsIgnoreCase(postId));
            this.postIds.add(postId);
        } catch (NotFoundException e) {
            throw new AddException("Add post failed!");
        }
    }

    public void setPostIdsFromDB() {

    }

    public List<Post> getPostIn4FromDB() {
        return null;
    }

}
