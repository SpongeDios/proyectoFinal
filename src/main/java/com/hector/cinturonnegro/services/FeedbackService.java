package com.hector.cinturonnegro.services;

import com.hector.cinturonnegro.models.Feedback;
import com.hector.cinturonnegro.repositories.FeedbackRepository;
import org.springframework.stereotype.Service;

@Service
public class FeedbackService extends BaseService<Feedback>{
    private final FeedbackRepository feedbackRepository;

    public FeedbackService(FeedbackRepository feedbackRepository) {
        super(feedbackRepository);
        this.feedbackRepository = feedbackRepository;
    }
}