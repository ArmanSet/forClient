package com.example.demo.service;

import com.example.demo.entity.OrderProducts;
import com.example.demo.repository.OrderProductsRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@RequiredArgsConstructor
public class OrderProductsService {
    private final OrderProductsRepository orderProductsRepository;

    public void save(OrderProducts orderProducts) {
        orderProductsRepository.save(orderProducts);
    }

    public Optional<OrderProducts> findById(Long id) {
        return orderProductsRepository.findById(id);
    }

    public void deleteById(Long id) {
        orderProductsRepository.deleteById(id);
    }
}