package com.udistrital.canalpanama.modelo;

public class VReserva {
	public int	  idReserva;
	public int 	  idAgente;
	public String codigoCliente;
	public String fechaReservaRealizada;
	public String fechaFuturoPaso;
	public String tipoBuque;
	public String sentido;
	public String periodo;
	public String estado;
	
	
	public int getIdReserva() {
		return idReserva;
	}
	public void setIdReserva(int idReserva) {
		this.idReserva = idReserva;
	}
	public int getIdAgente() {
		return idAgente;
	}
	public void setIdAgente(int idAgente) {
		this.idAgente = idAgente;
	}
	public String getCodigoCliente() {
		return codigoCliente;
	}
	public void setCodigoCliente(String codigoCliente) {
		this.codigoCliente = codigoCliente;
	}
	public String getFechaReservaRealizada() {
		return fechaReservaRealizada;
	}
	public void setFechaReservaRealizada(String fechaReservaRealizada) {
		this.fechaReservaRealizada = fechaReservaRealizada;
	}
	public String getFechaFuturoPaso() {
		return fechaFuturoPaso;
	}
	public void setFechaFuturoPaso(String fechaFuturoPaso) {
		this.fechaFuturoPaso = fechaFuturoPaso;
	}
	public String getTipoBuque() {
		return tipoBuque;
	}
	public void setTipoBuque(String tipoBuque) {
		this.tipoBuque = tipoBuque;
	}
	public String getSentido() {
		return sentido;
	}
	public void setSentido(String sentido) {
		this.sentido = sentido;
	}
	public String getPeriodo() {
		return periodo;
	}
	public void setPeriodo(String periodo) {
		this.periodo = periodo;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	
}
