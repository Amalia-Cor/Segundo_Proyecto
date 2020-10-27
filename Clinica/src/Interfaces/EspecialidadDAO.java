package Interfaces;

import java.util.List;

import Modelo.Especialidad;


public interface EspecialidadDAO {
	public List<Especialidad> ListadoEspecialidad();
	public Especialidad buscarXid(int codigoEspecialidad);
}
