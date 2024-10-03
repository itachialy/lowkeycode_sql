package org.example.demo.service;

import org.example.demo.common.BaseRepository;
import org.example.demo.model.MatBang;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MatBangServiceImpl implements IMatBangService {
    private final BaseRepository baseRepository = new BaseRepository();
    public MatBangServiceImpl() throws SQLException, ClassNotFoundException {
    }
    private static final String FIND_ALL = "select * from premises;";
    private static final String DELETE_MB = "delete from premises where maMb = ?";
    private static final String INSERT_MB ="insert into student(name, gender,email, class_id)\n" +
            "values (?,?,?,?)";
    @Override
    public List<MatBang> findAll() {
        Connection connection = baseRepository.getConnection();
        List<MatBang> list = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()){
                String maMb = resultSet.getString("maMb");
                double dienTich = resultSet.getDouble("dienTich");
                int trThai = resultSet.getInt("trThai");
                int tang = resultSet.getInt("tang");
                int loaiVp = resultSet.getInt("loaiVp");
                double giaThue = resultSet.getDouble("giaThue");
                Date startDate = resultSet.getDate("startDate");
                Date endDate = resultSet.getDate("endDate");
                list.add(new MatBang(maMb,dienTich,trThai,tang,loaiVp,giaThue,startDate,endDate));

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }


    @Override
    public void addMatBang(MatBang matBang) {
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(INSERT_STUDENT);
            ps.setString(1, matBang.getName());
            ps.setInt(2, matBang.getGender());
            ps.setString(3, matBang.getEmail());
            ps.setInt(4, matBang.getClazz().getClassId());
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void deleteMatBang(String maMb) {
        Connection connection = baseRepository.getConnection();
        try {
            PreparedStatement ps = connection.prepareStatement(DELETE_MB);
            ps.setString(1, maMb);
            ps.executeUpdate();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }


}
