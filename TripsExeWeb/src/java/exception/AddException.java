package exception;

public class AddException extends Exception {

    public AddException() {
        super();
    }

    public AddException(String message) {
        super(message);
    }

    public AddException(String message, Throwable cause) {
        super(message, cause);
    }
}
