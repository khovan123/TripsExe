package model;

import exception.*;
import java.util.*;
import java.util.function.*;

public class NotifyOfUser {

    private List<String> notifyIds = new ArrayList<>();

    public String search(Predicate<String> p) throws NotFoundException {
        for (String id : notifyIds) {
            if (p.test(id)) {
                return id;
            }
        }
        throw new NotFoundException("Can not found!");
    }

    public void addNotify(String notifyId) throws AddException {
        try {
            this.search(p -> p.equalsIgnoreCase(notifyId));
            this.notifyIds.add(notifyId);
        } catch (NotFoundException e) {
            throw new AddException("Add post failed!");
        }
    }

    //max: top 10 notify, priority: not marked read
    public void setNotifyIdsFromDB() {

    }

    public List<Notify> getNotifysIn4FromDB() {
        return null;
    }
}
