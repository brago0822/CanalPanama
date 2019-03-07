package com.udistrital.canalpanama.modelo;

public class Reserva {
	
	private int codCliente;
	private int	idBuque;
	private int	idCupo;
	private int	idAgente;
	private int	idPeriodo;
	private int idEstado;
	public int getCodCliente() {
		return codCliente;
	}
	public void setCodCliente(int codCliente) {
		this.codCliente = codCliente;
	}
	public int getIdBuque() {
		return idBuque;
	}
	public void setIdBuque(int idBuque) {
		this.idBuque = idBuque;
	}
	public int getIdCupo() {
		return idCupo;
	}
	public void setIdCupo(int idCupo) {
		this.idCupo = idCupo;
	}
	public int getIdAgente() {
		return idAgente;
	}
	public void setIdAgente(int idAgente) {
		this.idAgente = idAgente;
	}
	public int getIdPeriodo() {
		return idPeriodo;
	}
	public void setIdPeriodo(int idPeriodo) {
		this.idPeriodo = idPeriodo;
	}
	public int getIdEstado() {
		return idEstado;
	}
	public void setIdEstado(int idEstado) {
		this.idEstado = idEstado;
	}
	
}