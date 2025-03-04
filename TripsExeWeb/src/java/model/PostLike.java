package model;

import exception.*;
import java.util.*;
import java.util.function.*;

public class PostLike {

    private List<String> userIds = new ArrayList<>();

    public String search(Predicate<String> p) throws NotFoundException {
        for (String id : userIds) {
            if (p.test(id)) {
                return id;
            }
        }
        throw new NotFoundException("Can not found!");
    }

    public void addLikedUserId(String userId) throws AddException {
        try {
            this.search(p -> p.equalsIgnoreCase(userId));
            this.userIds.add(userId);
        } catch (NotFoundException e) {
            throw new AddException("Add post failed!");
        }
    }

    //max: top 10 notify, priority: not marked read
    public void setLikedUserIdsFromDB() {

    }

    //empty code here::not using this func
    public List<Notify> getLikedIn4FromDB() {
        return null;
    }

}
