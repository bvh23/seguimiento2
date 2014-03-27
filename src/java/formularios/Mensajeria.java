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
@Table(name = "Mensajeria")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Mensajeria.findAll", query = "SELECT m FROM Mensajeria m"),
    @NamedQuery(name = "Mensajeria.findByIdMensajeria", query = "SELECT m FROM Mensajeria m WHERE m.idMensajeria = :idMensajeria"),
    @NamedQuery(name = "Mensajeria.findByFechaIngreso", query = "SELECT m FROM Mensajeria m WHERE m.fechaIngreso = :fechaIngreso"),
    @NamedQuery(name = "Mensajeria.findByOrdenPedido", query = "SELECT m FROM Mensajeria m WHERE m.ordenPedido = :ordenPedido"),
    @NamedQuery(name = "Mensajeria.findByContacto", query = "SELECT m FROM Mensajeria m WHERE m.contacto = :contacto"),
    @NamedQuery(name = "Mensajeria.findByPrioridad", query = "SELECT m FROM Mensajeria m WHERE m.prioridad = :prioridad"),
    @NamedQuery(name = "Mensajeria.findByObservacionesMensajeria", query = "SELECT m FROM Mensajeria m WHERE m.observacionesMensajeria = :observacionesMensajeria"),
    @NamedQuery(name = "Mensajeria.findByZona", query = "SELECT m FROM Mensajeria m WHERE m.zona = :zona"),
})
   
    
public class Mensajeria implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "IdMensajeria")
    private Integer idMensajeria;
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
    @Size(min = 1, max = 100)
    @Column(name = "Contacto")
    private String contacto;
    @Size(max = 1)
    @Column(name = "Prioridad")
    private String prioridad;
    @Size(max = 300)
    @Column(name = "ObservacionesMensajeria")
    private String observacionesMensajeria;
    @JoinColumn(name = "Usuario", referencedColumnName = "Usuario")
    @ManyToOne(optional = false)
    private Login usuario;
    @JoinColumn(name = "CodigoCliente", referencedColumnName = "Codigo")
    @ManyToOne(optional = false)
    private Clientes codigoCliente;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 5)
    @Column(name = "Zona")
    private String zona;
   
    
    
    public Mensajeria() {
    }

    public Mensajeria(Integer idMensajeria) {
        this.idMensajeria = idMensajeria;
    }

    public Mensajeria(Integer idMensajeria, Date fechaIngreso, int ordenPedido, String contacto) {
        this.idMensajeria = idMensajeria;
        this.fechaIngreso = fechaIngreso;
        this.ordenPedido = ordenPedido;
        this.contacto = contacto;
    }

    public Integer getIdMensajeria() {
        return idMensajeria;
    }

    public void setIdMensajeria(Integer idMensajeria) {
        this.idMensajeria = idMensajeria;
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

    public String getContacto() {
        return contacto;
    }

    public void setContacto(String contacto) {
        this.contacto = contacto;
    }

    public String getPrioridad() {
        return prioridad;
    }

    public void setPrioridad(String prioridad) {
        this.prioridad = prioridad;
    }

    public String getObservacionesMensajeria() {
        return observacionesMensajeria;
    }

    public void setObservacionesMensajeria(String observacionesMensajeria) {
        this.observacionesMensajeria = observacionesMensajeria;
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
    
    public String getZona() {
        return zona;
    }

    public void setZona(String zona) {
        this.zona = zona;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idMensajeria != null ? idMensajeria.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Mensajeria)) {
            return false;
        }
        Mensajeria other = (Mensajeria) object;
        if ((this.idMensajeria == null && other.idMensajeria != null) || (this.idMensajeria != null && !this.idMensajeria.equals(other.idMensajeria))) {
            return false;
        }
        return true;
    }

    
    public String toString() {
        return "formularios.Mensajeria[ idMensajeria=" + idMensajeria + " ]";
    }
    
}
