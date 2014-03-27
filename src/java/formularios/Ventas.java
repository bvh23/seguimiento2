/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package formularios;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
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
import javax.faces.event.AbortProcessingException;
import javax.faces.event.ValueChangeEvent;
import javax.faces.event.ValueChangeListener;

/**
 *
 * @author Jhonnatan Elias Medina Agudelo
 */
@Entity
@Table(name = "Ventas")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Ventas.findAll", query = "SELECT v FROM Ventas v"),
    @NamedQuery(name = "Ventas.findByIdVenta", query = "SELECT v FROM Ventas v WHERE v.idVenta = :idVenta"),
    @NamedQuery(name = "Ventas.findByFechaIngreso", query = "SELECT v FROM Ventas v WHERE v.fechaIngreso = :fechaIngreso"),
    @NamedQuery(name = "Ventas.findByOrdenPedido", query = "SELECT v FROM Ventas v WHERE v.ordenPedido = :ordenPedido"),
    @NamedQuery(name = "Ventas.findByHorario", query = "SELECT v FROM Ventas v WHERE v.horario = :horario"),
    @NamedQuery(name = "Ventas.findByContacto", query = "SELECT v FROM Ventas v WHERE v.contacto = :contacto"),
    @NamedQuery(name = "Ventas.findByZona", query = "SELECT v FROM Ventas v WHERE v.zona = :zona"),
    @NamedQuery(name = "Ventas.findByPrioridad", query = "SELECT v FROM Ventas v WHERE v.prioridad = :prioridad"),
    @NamedQuery(name = "Ventas.findByObservacionesVentas", query = "SELECT v FROM Ventas v WHERE v.observacionesVentas = :observacionesVentas"),
    @NamedQuery(name = "Ventas.findByFechaDespacho", query = "SELECT v FROM Ventas v WHERE v.fechaDespacho = :fechaDespacho")})
public class Ventas implements Serializable {
    
    
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "IdVenta")
    private Integer idVenta;
    @Basic(optional = false)
    @NotNull
    @Column(name = "FechaIngreso")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaIngreso;
    @Basic(optional = false)
    @NotNull
    @Column(name = "OrdenPedido")
    private int ordenPedido;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 7)
    @Column(name = "Horario")
    private String horario;
    @Size(max = 250)
    @Column(name = "Contacto")
    private String contacto;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 5)
    @Column(name = "Zona")
    private String zona;
    @Size(max = 1)
    @Column(name = "Prioridad")
    private String prioridad;
    @Size(max = 800)
    @Column(name = "ObservacionesVentas")
    private String observacionesVentas;
    @Column(name = "FechaDespacho")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaDespacho;
    @JoinColumn(name = "Usuario", referencedColumnName = "Usuario")
    @ManyToOne(optional = false)
    private Login usuario;
    @JoinColumn(name = "CodigoCliente", referencedColumnName = "Codigo")
    @ManyToOne(optional = false)
    
    private Clientes codigoCliente;
 public List<String> complete(String query) {  
        List<String> results = new ArrayList<String>();  
          
        for (int i = 0; i < 10; i++) {  
            results.add(query + i);  
        }  
          
        return results;  
    }  
    public Ventas() {
    }

    public Ventas(Integer idVenta) {
        this.idVenta = idVenta;
    }

    public Ventas(Integer idVenta, Date fechaIngreso, int ordenPedido, String horario, String zona) {
        this.idVenta = idVenta;
        this.fechaIngreso = fechaIngreso;
        this.ordenPedido = ordenPedido;
        this.horario = horario;
        this.zona = zona;
    }

    public Integer getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(Integer idVenta) {
        this.idVenta = idVenta;
    }

    public Date getFechaIngreso() {
        return fechaIngreso;
    }

    public void setFechaIngreso(Date fechaIngreso) {
        this.fechaIngreso = fechaIngreso;
    }

    public int getOrdenPedido() {
        return ordenPedido;
    }

    public void setOrdenPedido(int ordenPedido) {
        this.ordenPedido = ordenPedido;
    }

    public String getHorario() {
        return horario;
    }

    public void setHorario(String horario) {
        this.horario = horario;
    }

    public String getContacto() {
        return contacto;
    }

    public void setContacto(String contacto) {
        this.contacto = contacto;
    }

    public String getZona() {
        return zona;
    }

    public void setZona(String zona) {
        this.zona = zona;
    }

    public String getPrioridad() {
        return prioridad;
    }

    public void setPrioridad(String prioridad) {
        this.prioridad = prioridad;
    }

    public String getObservacionesVentas() {
        return observacionesVentas;
    }

    public void setObservacionesVentas(String observacionesVentas) {
        this.observacionesVentas = observacionesVentas;
    }

    public Date getFechaDespacho() {
        return fechaDespacho;
    }

    public void setFechaDespacho(Date fechaDespacho) {
        this.fechaDespacho = fechaDespacho;
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
        hash += (idVenta != null ? idVenta.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Ventas)) {
            return false;
        }
        Ventas other = (Ventas) object;
        if ((this.idVenta == null && other.idVenta != null) || (this.idVenta != null && !this.idVenta.equals(other.idVenta))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "formularios.Ventas[ idVenta=" + idVenta + " ]";
    }
    
    
     

 

}
    

