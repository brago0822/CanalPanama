package com.udistrital.canalpanama.modelo;

import java.sql.Date;

public class Cupo {
	private int id;
	private String tipo_esclusa;
	private String sentido;
	private Date fecha;
	private String tipo_cupo;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTipo_esclusa() {
		return tipo_esclusa;
	}
	public void setTipo_esclusa(String tipo_esclusa) {
		this.tipo_esclusa = tipo_esclusa;
	}
	public String getSentido() {
		return sentido;
	}
	public void setSentido(String sentido) {
		this.sentido = sentido;
	}
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	public String getTipo_cupo() {
		return tipo_cupo;
	}
	public void setTipo_cupo(String tipo_cupo) {
		this.tipo_cupo = tipo_cupo;
	}
	
	
}
