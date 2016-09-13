package com.etsmtl.log635.labo1.helloworld;

public class Message {
    private String message;

    private MessageStatus status;

    public String getMessage() {
        return this.message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public MessageStatus getStatus() {
        return this.status;
    }

    public void setStatus(MessageStatus status) {
        this.status = status;
    }
}