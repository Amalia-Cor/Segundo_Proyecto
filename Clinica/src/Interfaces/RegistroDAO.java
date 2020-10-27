package Interfaces;

import java.util.List;

import Modelo.Registro;

public interface RegistroDAO {
	public String Agregar(Registro registro);
	public List<Registro> ListadoRegistro();

}
