package Interfaces;

import java.util.List;

import Modelo.Atencion;

public interface AtencionDAO {
	public List<Atencion> ListadoAtencion();
	public Atencion buscarXid(int codigoAtencion);
}
