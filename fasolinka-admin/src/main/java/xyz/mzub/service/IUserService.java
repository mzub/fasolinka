package xyz.mzub.service;

import java.util.List;

import org.springframework.stereotype.Service;

import xyz.mzub.dto.UserDto;

@Service
public interface IUserService {

    List<UserDto> getUsers();

}
