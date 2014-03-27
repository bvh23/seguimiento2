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
@Table(name = "Gestion")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Gestion.findAll", query = "SELECT g FROM Gestion g"),
    @NamedQuery(name = "Gestion.findByIdGestion", query = "SELECT g FROM Gestion g WHERE g.idGestion = :idGestion"),
    @NamedQuery(name = "Gestion.findByFechaIngreso", query = "SELECT g FROM Gestion g WHERE g.fechaIngreso = :fechaIngreso"),
    @NamedQuery(name = "Gestion.findByHorario", query = "SELECT g FROM Gestion g WHERE g.horario = :horario"),
    @NamedQuery(name = "Gestion.findByContacto", query = "SELECT g FROM Gestion g WHERE g.contacto = :contacto"),
    @NamedQuery(name = "Gestion.findByZona", query = "SELECT g FROM Gestion g WHERE g.zona = :zona"),
    @NamedQuery(name = "Gestion.findByPrioridad", query = "SELECT g FROM Gestion g WHERE g.prioridad = :prioridad"),
    @NamedQuery(name = "Gestion.findByObservacionesGestion", query = "SELECT g FROM Gestion g WHERE g.observacionesGestion = :observacionesGestion")
})
public class Gestion implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "IdGestion")
    private Integer idGestion;
    @Basic(optional = false)
    @NotNull
    @Column(name = "FechaIngreso")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaIngreso;
    @JoinColumn(name = "Usuario", referencedColumnName = "Usuario")
    @ManyToOne(optional = false)
    private Login usuario;
    @JoinColumn(name = "CodigoCliente", referencedColumnName = "Codigo")
    @ManyToOne(optional = false)
    private Clientes codigoCliente;
    
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 6)
    @Column(name = "Horario")
    private String horario;
    @Basic(optional = false)
    @Size(max = 150)
    @Column(name = "Contacto")
    private String contacto;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 5)
    @Column(name = "Zona")
    private String zona;
    @Basic(optional = false)
    @Size(max = 1)
    @Column(name = "Prioridad")
    private String prioridad;
    @Size(max = 500)
    @Column(name = "ObservacionesGestion")
    private String observacionesGestion;
    
    public Gestion() {
    }

    public Gestion(Integer idGestion) {
        this.idGestion = idGestion;
    }

    public Gestion(Integer idGestion, Date fechaIngreso) {
        this.idGestion = idGestion;
        this.fechaIngreso = fechaIngreso;
    }

    public Integer getIdGestion() {
        return idGestion;
    }

    public void setIdGestion(Integer idGestion) {
        this.idGestion = idGestion;
    }

    public Date getFechaIngreso() {
        return fechaIngreso;
    }

    public void setFechaIngreso(Date fechaIngreso) {
        this.fechaIngreso = fechaIngreso;
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
    public String getObservacionesGestion() {
        return observacionesGestion;
    }

    public void setObservacionesGestion(String observacionesGestion) {
        this.observacionesGestion = observacionesGestion;
    }
    

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idGestion != null ? idGestion.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Gestion)) {
            return false;
        }
        Gestion other = (Gestion) object;
        if ((this.idGestion == null && other.idGestion != null) || (this.idGestion != null && !this.idGestion.equals(other.idGestion))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "formularios.Gestion[ idGestion=" + idGestion + " ]";
    }
    
}
