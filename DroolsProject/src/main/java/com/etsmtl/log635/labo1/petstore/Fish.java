package com.etsmtl.log635.labo1.petstore;

public class Fish extends Product {
    private FishType fishType;

    public Fish() {
        this.setType(ProductType.FISH);
    }

    public FishType getFishType() {
        return fishType;
    }

    public void setFishType(FishType fishType) {
        this.fishType = fishType;
    }
}
