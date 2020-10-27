package Modelo;

public class Especialidad {
	int codigo;
	String especialidad;
	
	public Especialidad()
	{
		
	}

	public Especialidad(int codigo, String especialidad) {
		
		this.codigo = codigo;
		this.especialidad = especialidad;
	}

	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public String getEspecialidad() {
		return especialidad;
	}

	public void setEspecialidad(String especialidad) {
		this.especialidad = especialidad;
	}
	
	
}
