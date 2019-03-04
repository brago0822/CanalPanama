package com.udistrital.canalpanama.modelo;

public class Apartamento {
	private int id;
	private double area_m2;
	private double coeficiente;
	private double valor_cuota;
	private String tipo_id;
	private long identificacion;
	private int bloque;
	private String conjunto;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public double getArea_m2() {
		return area_m2;
	}
	public void setArea_m2(double area_m2) {
		this.area_m2 = area_m2;
	}
	public double getCoeficiente() {
		return coeficiente;
	}
	public void setCoeficiente(double d) {
		this.coeficiente = d;
	}
	public double getValor_cuota() {
		return valor_cuota;
	}
	public void setValor_cuota(double d) {
		this.valor_cuota = d;
	}
	public String getTipo_id() {
		return tipo_id;
	}
	public void setTipo_id(String tipo_id) {
		this.tipo_id = tipo_id;
	}
	public long getIdentificacion() {
		return identificacion;
	}
	public void setIdentificacion(long l) {
		this.identificacion = l;
	}
	public int getBloque() {
		return bloque;
	}
	public void setBloque(int bloque) {
		this.bloque = bloque;
	}
	public String getConjunto() {
		return conjunto;
	}
	public void setConjunto(String conjunto) {
		this.conjunto = conjunto;
	}
	
}
