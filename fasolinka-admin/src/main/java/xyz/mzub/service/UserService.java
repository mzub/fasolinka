package xyz.mzub.service;

import java.util.List;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;

import xyz.mzub.dto.UserDto;
import xyz.mzub.repo.UserRepository;

public class UserService implements IUserService {
	
	private UserRepository userRepository;
    private ModelMapper modelMapper;

    public UserService(UserRepository userRepository, ModelMapper modelMapper) {
		this.userRepository = userRepository;
        this.modelMapper = modelMapper;
	}
	
	@Override
	public List<UserDto> getUsers() {
        return userRepository.findAll().stream().map(enitity -> modelMapper.map(enitity, UserDto.class)).collect(Collectors.toList());
	}
	
	

}
