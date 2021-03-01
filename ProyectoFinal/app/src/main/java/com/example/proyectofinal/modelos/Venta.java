package com.example.proyectofinal.modelos;

public class Venta {
    private String fecha;
    private Double valor;
    private String descripcion;
    private Integer cantlibros;
    private String date_created;
    private String updated_ad;

    public Venta(){}

    public Venta(String fecha, Double valor,String descripcion,Integer cantlibros,String date_created,String updated_ad){
        this.fecha=fecha;
        this.valor=valor;
        this.descripcion=descripcion;
        this.cantlibros=cantlibros;
        this.date_created=date_created;
        this.updated_ad=updated_ad;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public Double getValor() {
        return valor;
    }

    public void setValor(Double valor) {
        this.valor = valor;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Integer getCantlibros() {
        return cantlibros;
    }

    public void setCantlibros(Integer cantlibros) {
        this.cantlibros = cantlibros;
    }

    public String getDate_created() {
        return date_created;
    }

    public void setDate_created(String date_created) {
        this.date_created = date_created;
    }

    public String getUpdated_ad() {
        return updated_ad;
    }

    public void setUpdated_ad(String updated_ad) {
        this.updated_ad = updated_ad;
    }
}
