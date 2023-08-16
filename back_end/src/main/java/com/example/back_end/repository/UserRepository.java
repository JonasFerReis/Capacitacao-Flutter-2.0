package com.example.back_end.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.back_end.models.User;

public interface UserRepository extends JpaRepository<User, Long>{
    
}
