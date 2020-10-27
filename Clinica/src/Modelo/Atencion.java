package Modelo;

public class Atencion {
	int codigoH;
	String hora;
	public Atencion()
	{
		
	}
	public Atencion(int codigoH, String hora) {
		
		this.codigoH = codigoH;
		this.hora = hora;
	}
	public int getCodigoH() {
		return codigoH;
	}
	public void setCodigoH(int codigoH) {
		this.codigoH = codigoH;
	}
	public String getHora() {
		return hora;
	}
	public void setHora(String hora) {
		this.hora = hora;
	}
	
	
}
