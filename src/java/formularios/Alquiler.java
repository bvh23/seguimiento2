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
@Table(name = "Alquiler")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Alquiler.findAll", query = "SELECT a FROM Alquiler a"),
    @NamedQuery(name = "Alquiler.findByIdAlquiler", query = "SELECT a FROM Alquiler a WHERE a.idAlquiler = :idAlquiler"),
    @NamedQuery(name = "Alquiler.findByOrdenPedido", query = "SELECT a FROM Alquiler a WHERE a.ordenPedido = :ordenPedido"),
    @NamedQuery(name = "Alquiler.findByFechaIngreso", query = "SELECT a FROM Alquiler a WHERE a.fechaIngreso = :fechaIngreso"),
    @NamedQuery(name = "Alquiler.findByHorario", query = "SELECT a FROM Alquiler a WHERE a.horario = :horario"),
    @NamedQuery(name = "Alquiler.findByContacto", query = "SELECT a FROM Alquiler a WHERE a.contacto = :contacto"),
    @NamedQuery(name = "Alquiler.findByZona", query = "SELECT a FROM Alquiler a WHERE a.zona = :zona"),
    @NamedQuery(name = "Alquiler.findByPrioridad", query = "SELECT a FROM Alquiler a WHERE a.prioridad = :prioridad"),
    @NamedQuery(name = "Alquiler.findByObservacionesAlquiler", query = "SELECT a FROM Alquiler a WHERE a.observacionesAlquiler = :observacionesAlquiler"),
    @NamedQuery(name = "Alquiler.findByFechaDespacho", query = "SELECT a FROM Alquiler a WHERE a.fechaDespacho = :fechaDespacho")})
public class Alquiler implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "IdAlquiler")
    private Integer idAlquiler;
    @Basic(optional = false)
    @NotNull
    @Column(name = "OrdenPedido")
    private int ordenPedido;
    @Basic(optional = false)
    @NotNull
    @Column(name = "FechaIngreso")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaIngreso;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 7)
    @Column(name = "Horario")
    private String horario;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
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
    @Size(max = 200)
    @Column(name = "ObservacionesAlquiler")
    private String observacionesAlquiler;
    @Column(name = "FechaDespacho")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaDespacho;
    @JoinColumn(name = "Usuario", referencedColumnName = "Usuario")
    @ManyToOne(optional = false)
    private Login usuario;
    @JoinColumn(name = "CodigoCliente", referencedColumnName = "Codigo")
    @ManyToOne(optional = false)
    private Clientes codigoCliente;

    public Alquiler() {
    }

    public Alquiler(Integer idAlquiler) {
        this.idAlquiler = idAlquiler;
    }

    public Alquiler(Integer idAlquiler, int ordenPedido, Date fechaIngreso, String horario, String contacto, String zona) {
        this.idAlquiler = idAlquiler;
        this.ordenPedido = ordenPedido;
        this.fechaIngreso = fechaIngreso;
        this.horario = horario;
        this.contacto = contacto;
        this.zona = zona;
    }

    public Integer getIdAlquiler() {
        return idAlquiler;
    }

    public void setIdAlquiler(Integer idAlquiler) {
        this.idAlquiler = idAlquiler;
    }

    public int getOrdenPedido() {
        return ordenPedido;
    }

    public void setOrdenPedido(int ordenPedido) {
        this.ordenPedido = ordenPedido;
    }

    public Date getFechaIngreso() {
        return fechaIngreso;
    }

    public void setFechaIngreso(Date fechaIngreso) {
        this.fechaIngreso = fechaIngreso;
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

    public String getObservacionesAlquiler() {
        return observacionesAlquiler;
    }

    public void setObservacionesAlquiler(String observacionesAlquiler) {
        this.observacionesAlquiler = observacionesAlquiler;
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
        hash += (idAlquiler != null ? idAlquiler.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Alquiler)) {
            return false;
        }
        Alquiler other = (Alquiler) object;
        if ((this.idAlquiler == null && other.idAlquiler != null) || (this.idAlquiler != null && !this.idAlquiler.equals(other.idAlquiler))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "formularios.Alquiler[ idAlquiler=" + idAlquiler + " ]";
    }
    
}
