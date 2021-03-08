package xyz.mzub.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import xyz.mzub.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long>{

}
