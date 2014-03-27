/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package formularios;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Jhonnatan Elias Medina Agudelo
 */
@Entity
@Table(name = "Proceso")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Proceso.findAll", query = "SELECT p FROM Proceso p ORDER BY P.idProceso DESC"),
    @NamedQuery(name = "Proceso.findByIdProceso", query = "SELECT p FROM Proceso p WHERE p.idProceso = :idProceso ORDER BY P.idProceso DESC "),
    @NamedQuery(name = "Proceso.findById", query = "SELECT p FROM Proceso p WHERE p.id = :id"),
    @NamedQuery(name = "Proceso.findByVentas1", query = "SELECT p FROM Proceso p WHERE p.ventas1 = :ventas1"),
    @NamedQuery(name = "Proceso.findByVentas2", query = "SELECT p FROM Proceso p WHERE p.ventas2 = :ventas2"),
    @NamedQuery(name = "Proceso.findByVentas3", query = "SELECT p FROM Proceso p WHERE p.ventas3 = :ventas3"),
    @NamedQuery(name = "Proceso.findByGerenteVentas", query = "SELECT p FROM Proceso p WHERE p.gerenteVentas = :gerenteVentas"),
    @NamedQuery(name = "Proceso.findBySTIngreso", query = "SELECT p FROM Proceso p WHERE p.sTIngreso = :sTIngreso"),
    @NamedQuery(name = "Proceso.findBySTReparacion", query = "SELECT p FROM Proceso p WHERE p.sTReparacion = :sTReparacion"),
    @NamedQuery(name = "Proceso.findBySTLiberacion", query = "SELECT p FROM Proceso p WHERE p.sTLiberacion = :sTLiberacion"),
    @NamedQuery(name = "Proceso.findBySTPendAutorizado", query = "SELECT p FROM Proceso p WHERE p.sTPendAutorizado = :sTPendAutorizado"),
    @NamedQuery(name = "Proceso.findByObservacionST", query = "SELECT p FROM Proceso p WHERE p.observacionST = :observacionST"),
    @NamedQuery(name = "Proceso.findByAlmacen", query = "SELECT p FROM Proceso p WHERE p.almacen = :almacen"),
    @NamedQuery(name = "Proceso.findByObservacionAlmacen", query = "SELECT p FROM Proceso p WHERE p.observacionAlmacen = :observacionAlmacen"),
    @NamedQuery(name = "Proceso.findByAlquiler", query = "SELECT p FROM Proceso p WHERE p.alquiler = :alquiler"),
    @NamedQuery(name = "Proceso.findByFacturacion", query = "SELECT p FROM Proceso p WHERE p.facturacion = :facturacion"),
    @NamedQuery(name = "Proceso.findByAuxContable", query = "SELECT p FROM Proceso p WHERE p.auxContable = :auxContable"),
    @NamedQuery(name = "Proceso.findByCartera", query = "SELECT p FROM Proceso p WHERE p.cartera = :cartera"),
    @NamedQuery(name = "Proceso.findByCalidad", query = "SELECT p FROM Proceso p WHERE p.calidad = :calidad"),
    @NamedQuery(name = "Proceso.findByGerencia", query = "SELECT p FROM Proceso p WHERE p.gerencia = :gerencia"),
    @NamedQuery(name = "Proceso.findByServicioCliente", query = "SELECT p FROM Proceso p WHERE p.servicioCliente = :servicioCliente"),
    @NamedQuery(name = "Proceso.findByRecepcion", query = "SELECT p FROM Proceso p WHERE p.recepcion = :recepcion"),
    @NamedQuery(name = "Proceso.findByFechadespacho", query = "SELECT p FROM Proceso p WHERE p.fechadespacho = :fechadespacho"),
    @NamedQuery(name = "Proceso.findByObservaciones", query = "SELECT p FROM Proceso p WHERE p.observaciones = :observaciones")
})
public class Proceso implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "IdProceso")
    private Integer idProceso;
    @Column(name = "Id")
    private Integer id;
    @Size(max = 2)
    @Column(name = "Ventas1")
    private String ventas1;
    @Size(max = 2)
    @Column(name = "Ventas2")
    private String ventas2;
    @Size(max = 2)
    @Column(name = "Ventas3")
    private String ventas3;
    @Size(max = 2)
    @Column(name = "GerenteVentas")
    private String gerenteVentas;
    @Size(max = 2)
    @Column(name = "S_T_Ingreso")
    private String sTIngreso;
    @Size(max = 2)
    @Column(name = "S_T_Reparacion")
    private String sTReparacion;
    @Size(max = 2)
    @Column(name = "S_T_Liberacion")
    private String sTLiberacion;
    @Size(max = 2)
    @Column(name = "S_T_Pend_Autorizado")
    private String sTPendAutorizado;
    @Size(max = 400)
    @Column(name = "Observacion_S_T")
    private String observacionST;
    @Size(max = 2)
    @Column(name = "Almacen")
    private String almacen;
    @Size(max = 400)
    @Column(name = "ObservacionAlmacen")
    private String observacionAlmacen;
    @Size(max = 2)
    @Column(name = "Alquiler")
    private String alquiler;
    @Size(max = 2)
    @Column(name = "Facturacion")
    private String facturacion;
    @Size(max = 2)
    @Column(name = "AuxContable")
    private String auxContable;
    @Size(max = 2)
    @Column(name = "Cartera")
    private String cartera;
    @Size(max = 2)
    @Column(name = "Calidad")
    private String calidad;
    @Size(max = 2)
    @Column(name = "Gerencia")
    private String gerencia;
    @Size(max = 2)
    @Column(name = "ServicioCliente")
    private String servicioCliente;
    @Size(max = 6)
    @Column(name = "Recepcion")
    private String recepcion;
    
    @Column(name = "Fechadespacho")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechadespacho;
    @Size(max = 400)
    @Column(name = "Observaciones")
    private String observaciones;
    
    @JoinColumn(name = "Usuario", referencedColumnName = "Usuario")
    @ManyToOne(optional = false)
    private Login usuario;
    @JoinColumn(name = "CodigoCliente", referencedColumnName = "Codigo")
    @ManyToOne(optional = false)
    private Clientes codigoCliente;

    public Proceso() {
    }

    public Proceso(Integer idProceso) {
        this.idProceso = idProceso;
    }

    public Integer getIdProceso() {
        return idProceso;
    }

    public void setIdProceso(Integer idProceso) {
        this.idProceso = idProceso;
    }
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }


    public String getVentas1() {
        return ventas1;
    }

    public void setVentas1(String ventas1) {
        this.ventas1 = ventas1;
    }

    public String getVentas2() {
        return ventas2;
    }

    public void setVentas2(String ventas2) {
        this.ventas2 = ventas2;
    }

    public String getVentas3() {
        return ventas3;
    }

    public void setVentas3(String ventas3) {
        this.ventas3 = ventas3;
    }

    public String getGerenteVentas() {
        return gerenteVentas;
    }

    public void setGerenteVentas(String gerenteVentas) {
        this.gerenteVentas = gerenteVentas;
    }

    public String getSTIngreso() {
        return sTIngreso;
    }

    public void setSTIngreso(String sTIngreso) {
        this.sTIngreso = sTIngreso;
    }

    public String getSTReparacion() {
        return sTReparacion;
    }

    public void setSTReparacion(String sTReparacion) {
        this.sTReparacion = sTReparacion;
    }

    public String getSTLiberacion() {
        return sTLiberacion;
    }

    public void setSTLiberacion(String sTLiberacion) {
        this.sTLiberacion = sTLiberacion;
    }

    public String getSTPendAutorizado() {
        return sTPendAutorizado;
    }

    public void setSTPendAutorizado(String sTPendAutorizado) {
        this.sTPendAutorizado = sTPendAutorizado;
    }

    public String getObservacionST() {
        return observacionST;
    }

    public void setObservacionST(String observacionST) {
        this.observacionST = observacionST;
    }

    public String getAlmacen() {
        return almacen;
    }

    public void setAlmacen(String almacen) {
        this.almacen = almacen;
    }

    public String getObservacionAlmacen() {
        return observacionAlmacen;
    }

    public void setObservacionAlmacen(String observacionAlmacen) {
        this.observacionAlmacen = observacionAlmacen;
    }

    public String getAlquiler() {
        return alquiler;
    }

    public void setAlquiler(String alquiler) {
        this.alquiler = alquiler;
    }

    public String getFacturacion() {
        return facturacion;
    }

    public void setFacturacion(String facturacion) {
        this.facturacion = facturacion;
    }

    public String getAuxContable() {
        return auxContable;
    }

    public void setAuxContable(String auxContable) {
        this.auxContable = auxContable;
    }

    public String getCartera() {
        return cartera;
    }

    public void setCartera(String cartera) {
        this.cartera = cartera;
    }

    public String getCalidad() {
        return calidad;
    }

    public void setCalidad(String calidad) {
        this.calidad = calidad;
    }

    public String getGerencia() {
        return gerencia;
    }

    public void setGerencia(String gerencia) {
        this.gerencia = gerencia;
    }

    public String getServicioCliente() {
        return servicioCliente;
    }

    public void setServicioCliente(String servicioCliente) {
        this.servicioCliente = servicioCliente;
    }

    public String getRecepcion() {
        return recepcion;
    }

    public void setRecepcion(String recepcion) {
        this.recepcion = recepcion;
    }

    public Date getFechadespacho() {
        return fechadespacho;
    }

    public void setFechadespacho(Date fechadespacho) {
        this.fechadespacho = fechadespacho;
    }
    
        public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    public Login getUsuario() {
        return usuario;
    }

    public void setUsuario(Login usuario) {
        this.usuario = usuario;
    }

    public Clientes getCodigoCliente() {
        return codigoCliente;
    }

    public void setCodigoCliente(Clientes codigoCliente) {
        this.codigoCliente = codigoCliente;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idProceso != null ? idProceso.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Proceso)) {
            return false;
        }
        Proceso other = (Proceso) object;
        if ((this.idProceso == null && other.idProceso != null) || (this.idProceso != null && !this.idProceso.equals(other.idProceso))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "formularios.Proceso[ idProceso=" + idProceso + " ]";
    }
    
}
