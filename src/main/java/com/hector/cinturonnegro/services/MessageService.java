package com.hector.cinturonnegro.services;

import com.hector.cinturonnegro.models.Message;
import com.hector.cinturonnegro.repositories.MessageRepository;
import org.springframework.stereotype.Service;

@Service
public class MessageService extends BaseService<Message>{
    private final MessageRepository messageRepository;

    public MessageService(MessageRepository messageRepository) {
        super(messageRepository);
        this.messageRepository = messageRepository;
    }
}