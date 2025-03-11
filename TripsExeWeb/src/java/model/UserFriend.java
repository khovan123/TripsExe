package model;

import exception.*;
import java.util.*;
import java.util.function.*;

public class UserFriend {

    private List<String> friendIds = new ArrayList<>();

    public List<String> getFriendIds() {
        return this.friendIds;
    }

    public String search(Predicate<String> p) throws NotFoundException {
        for (String id : friendIds) {
            if (p.test(id)) {
                return id;
            }
        }
        throw new NotFoundException("Can not found!");
    }

    public void addFriend(String anotherUserId) throws AddException {
        try {
            this.search(p -> p.equalsIgnoreCase(anotherUserId));
            this.friendIds.add(anotherUserId);
        } catch (NotFoundException e) {
            throw new AddException("Add friend failed!");
        }
    }

    public void setFriendIdsFromDB() {

    }

    public List<User> getFriendsIn4FromDB() {
        return null;
    }

}
