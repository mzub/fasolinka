package xyz.mzub;

import org.modelmapper.ModelMapper;
import org.springframework.boot.SpringBootConfiguration;
import org.springframework.context.annotation.Bean;

@SpringBootConfiguration
public class Configuration {

    @Bean
    public ModelMapper modelMapper() {
        return new ModelMapper();
    }
}
