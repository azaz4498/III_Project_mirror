package a592070.pojo;

import com.fasterxml.jackson.annotation.*;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Date;

@JsonIgnoreProperties(ignoreUnknown = true)
@Entity
@Table(name = "TRAVEL_ELE_C")
public class TravelEleCarDO {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer sn;

//    private Timestamp time;
    @Column(name = "time")@Temporal(TemporalType.TIMESTAMP)
    private Date time;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "C_ID", referencedColumnName = "SN")
    private CarVO car;

    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.MERGE)
    @JoinColumn(name = "TRAVEL_ID", referencedColumnName = "SN")
    private TravelSetDO travelSetDO;

    public TravelEleCarDO() {
    }

    public Integer getSn() {
        return sn;
    }

    public void setSn(Integer sn) {
        this.sn = sn;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public CarVO getCar() {
        return car;
    }

    public void setCar(CarVO car) {
        this.car = car;
    }

    public TravelSetDO getTravelSetDO() {
        return travelSetDO;
    }

    public void setTravelSetDO(TravelSetDO travelSetDO) {
        this.travelSetDO = travelSetDO;
    }

    @Override
    public String toString() {
        return "TravelEleCarDO{" +
                "sn=" + sn +
                ", time=" + time +
                ", car=" + car +
                '}';
    }
}
