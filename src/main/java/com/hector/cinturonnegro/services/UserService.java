package com.hector.cinturonnegro.services;

import com.hector.cinturonnegro.models.User;
import com.hector.cinturonnegro.repositories.BaseRepository;
import com.hector.cinturonnegro.repositories.UserRepository;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;

@Service
public class UserService extends BaseService<User> {
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        super(userRepository);
        this.userRepository = userRepository;
    }

    public User registerUser(User user){
        String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
        user.setPassword(hashed);
        return userRepository.save(user);
    }

    public boolean autenticarUsuario(String email, String password){
        User user = userRepository.findUserByEmail(email);
        if(user == null){
            return false;
        } else{
            if (BCrypt.checkpw(password, user.getPassword())){
                return true;
            } else {
                return false;
            }
        }
    }

    public boolean emailExist(String email) {
        return userRepository.existsByEmail(email);
    }
}
