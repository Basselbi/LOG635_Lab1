package com.etsmtl.log635.labo1.petstore;

import java.time.LocalDateTime;

public abstract class TaxRate {
    private LocalDateTime dateActive = LocalDateTime.MIN;
    private Double rate;

    public TaxRate(Double rate) {
        this.rate = rate;
    }

    public TaxRate(Double rate, LocalDateTime dateActive) {
        this.rate = rate;
        this.dateActive = dateActive;
    }

    public LocalDateTime getDateActive() {
        return dateActive;
    }

    public Double getRate() {
        return rate;
    }
}
