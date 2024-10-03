package org.example.demo.service;

import org.example.demo.model.MatBang;

import java.util.List;

public interface IMatBangService {
    List<MatBang> findAll();
    void addMatBang(MatBang matBang);

    void deleteMatBang(String maMb);


}
