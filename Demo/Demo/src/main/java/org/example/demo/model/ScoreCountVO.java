package org.example.demo.model;

import lombok.Data;
import java.math.BigDecimal;

@Data
public class ScoreCountVO {
    private Integer total_score;
    private BigDecimal avg_score;
    private String name;
}