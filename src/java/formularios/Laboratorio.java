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
@Table(name = "Laboratorio")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Laboratorio.findAll", query = "SELECT l FROM Laboratorio l"),
    @NamedQuery(name = "Laboratorio.findByIdLaboratorio", query = "SELECT l FROM Laboratorio l WHERE l.idLaboratorio = :idLaboratorio"),
    @NamedQuery(name = "Laboratorio.findByOrdenTecnica", query = "SELECT l FROM Laboratorio l WHERE l.ordenTecnica = :ordenTecnica"),
    @NamedQuery(name = "Laboratorio.findByFechaIngreso", query = "SELECT l FROM Laboratorio l WHERE l.fechaIngreso = :fechaIngreso"),
    @NamedQuery(name = "Laboratorio.findByHorario", query = "SELECT l FROM Laboratorio l WHERE l.horario = :horario"),
    @NamedQuery(name = "Laboratorio.findByContacto", query = "SELECT l FROM Laboratorio l WHERE l.contacto = :contacto"),
    @NamedQuery(name = "Laboratorio.findByZona", query = "SELECT l FROM Laboratorio l WHERE l.zona = :zona"),
    @NamedQuery(name = "Laboratorio.findByPrioridad", query = "SELECT l FROM Laboratorio l WHERE l.prioridad = :prioridad"),
    @NamedQuery(name = "Laboratorio.findByObservacionesLaboratorio", query = "SELECT l FROM Laboratorio l WHERE l.observacionesLaboratorio = :observacionesLaboratorio")
})
public class Laboratorio implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "IdLaboratorio")
    private Integer idLaboratorio;
    @Basic(optional = false)
    @NotNull
    @Column(name = "OrdenTecnica")
    private int ordenTecnica;
    @Basic(optional = false)
    @NotNull
    @Column(name = "FechaIngreso")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fechaIngreso;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 6)
    @Column(name = "Horario")
    private String horario;
    @Basic(optional = false)
    @Size(max = 40)
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
    @Size(max = 300)
    @Column(name = "ObservacionesLaboratorio")
    private String observacionesLaboratorio;
    
    @JoinColumn(name = "Usuario", referencedColumnName = "Usuario")
    @ManyToOne(optional = false)
    private Login usuario;
    @JoinColumn(name = "CodigoCliente", referencedColumnName = "Codigo")
    @ManyToOne(optional = false)
    private Clientes codigoCliente;

    public Laboratorio() {
    }

    public Laboratorio(Integer idLaboratorio) {
        this.idLaboratorio = idLaboratorio;
    }

    public Laboratorio(Integer idLaboratorio, int ordenTecnica, Date fechaIngreso) {
        this.idLaboratorio = idLaboratorio;
        this.ordenTecnica = ordenTecnica;
        this.fechaIngreso = fechaIngreso;
    }

    public Integer getIdLaboratorio() {
        return idLaboratorio;
    }

    public void setIdLaboratorio(Integer idLaboratorio) {
        this.idLaboratorio = idLaboratorio;
    }

    public int getOrdenTecnica() {
        return ordenTecnica;
    }

    public void setOrdenTecnica(int ordenTecnica) {
        this.ordenTecnica = ordenTecnica;
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
    
    public String getObservacionesLaboratorio() {
        return observacionesLaboratorio;
    }

    public void setObservacionesLaboratorio(String observacionesLaboratorio) {
        this.observacionesLaboratorio = observacionesLaboratorio;
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
        hash += (idLaboratorio != null ? idLaboratorio.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Laboratorio)) {
            return false;
        }
        Laboratorio other = (Laboratorio) object;
        if ((this.idLaboratorio == null && other.idLaboratorio != null) || (this.idLaboratorio != null && !this.idLaboratorio.equals(other.idLaboratorio))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "formularios.Laboratorio[ idLaboratorio=" + idLaboratorio + " ]";
    }
    
}
