package com.fintechviet.system.service;

import com.fintechviet.system.model.SystemParameter;

public interface SystemParameterService {
    SystemParameter getById(Integer id);
    void save(SystemParameter systemParameter);
    void delete(SystemParameter systemParameter);
}
