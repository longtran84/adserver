package com.fintechviet.system.service;

import com.fintechviet.system.model.SystemParameter;
import com.fintechviet.system.respository.SystemParameterRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SystemParameterServiceImpl implements SystemParameterService {
    @Autowired
    private SystemParameterRepository systemParameterRepository;

    @Override
    public SystemParameter getById(Integer id) {
        return systemParameterRepository.findOne(id);
    }

    @Override
    public void save(SystemParameter systemParameter) {
        systemParameterRepository.save(systemParameter);
    }

    @Override
    public void delete(SystemParameter systemParameter) {
        systemParameterRepository.delete(systemParameter);
    }
}
