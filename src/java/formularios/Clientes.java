/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package formularios;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Jhonnatan Elias Medina Agudelo

 */
@Entity
@Table(name = "Clientes")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Clientes.findAll", query = "SELECT c FROM Clientes c"),
    @NamedQuery(name = "Clientes.findByCodigo", query = "SELECT c FROM Clientes c WHERE c.codigo = :codigo"),
    @NamedQuery(name = "Clientes.findByNombreCliente", query = "SELECT c FROM Clientes c WHERE c.nombreCliente = :nombreCliente "),
    @NamedQuery(name = "Clientes.findByRazonSocial", query = "SELECT c FROM Clientes c WHERE c.razonSocial = :razonSocial"),
    @NamedQuery(name = "Clientes.findByDireccion", query = "SELECT c FROM Clientes c WHERE c.direccion = :direccion"),
    @NamedQuery(name = "Clientes.findByTelefono", query = "SELECT c FROM Clientes c WHERE c.telefono = :telefono"),
    @NamedQuery(name = "Clientes.findByCiudad", query = "SELECT c FROM Clientes c WHERE c.ciudad = :ciudad"),
    @NamedQuery(name = "Clientes.findByZona", query = "SELECT c FROM Clientes c WHERE c.zona = :zona"),
    @NamedQuery(name = "Clientes.findByContacto1", query = "SELECT c FROM Clientes c WHERE c.contacto1 = :contacto1"),
    @NamedQuery(name = "Clientes.findByContacto2", query = "SELECT c FROM Clientes c WHERE c.contacto2 = :contacto2"),
    @NamedQuery(name = "Clientes.findByContacto3", query = "SELECT c FROM Clientes c WHERE c.contacto3 = :contacto3"),
    @NamedQuery(name = "Clientes.findByObservaciones", query = "SELECT c FROM Clientes c WHERE c.observaciones = :observaciones")})
public class Clientes implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "Codigo")
    private Long codigo;
    @Size(max = 250)
    @Column(name = "NombreCliente")
    private String nombreCliente;
    @Size(max = 250)
    @Column(name = "RazonSocial")
    private String razonSocial;
    @Size(max = 250)
    @Column(name = "Direccion")
    private String direccion;
    @Size(max = 250)
    @Column(name = "Telefono")
    private String telefono;
    @Size(max = 250)
    @Column(name = "Ciudad")
    private String ciudad;
    @Size(max = 250)
    @Column(name = "Zona")
    private String zona;
    @Size(max = 250)
    @Column(name = "Contacto1")
    private String contacto1;
    @Size(max = 250)
    @Column(name = "Contacto2")
    private String contacto2;
    @Size(max = 250)
    @Column(name = "Contacto3")
    private String contacto3;
    @Size(max = 350)
    @Column(name = "Observaciones")
    private String observaciones;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "codigoCliente")
    private Collection<Ventas> ventasCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "codigoCliente")
    private Collection<Gestion> gestionCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "codigoCliente")
    private Collection<Laboratorio> laboratorioCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "codigoCliente")
    private Collection<Proceso> procesoCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "codigoCliente")
    private Collection<Alquiler> alquilerCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "codigoCliente")
    private Collection<Mensajeria> mensajeriaCollection;

    public Clientes() {
    }

    public Clientes(Long codigo) {
        this.codigo = codigo;
    }

    public Long getCodigo() {
        return codigo;
    }

    public void setCodigo(Long codigo) {
        this.codigo = codigo;
    }

    public String getNombreCliente() {
        return nombreCliente;
    }

    public void setNombreCliente(String nombreCliente) {
        this.nombreCliente = nombreCliente;
    }
      public String getRazonSocial() {
        return razonSocial;
    }

    public void setRazonSocial(String razonSocial) {
        this.razonSocial = razonSocial;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
 public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    } 
    public String getZona() {
        return zona;
    }

    public void setZona(String zona) {
        this.zona = zona;
    }
    public String getContacto1() {
        return contacto1;
    }

    public void setContacto1(String contacto1) {
        this.contacto1 = contacto1;
    }

    public String getContacto2() {
        return contacto2;
    }

    public void setContacto2(String contacto2) {
        this.contacto2 = contacto2;
    }

    public String getContacto3() {
        return contacto3;
    }

    public void setContacto3(String contacto3) {
        this.contacto3 = contacto3;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }

    @XmlTransient
    public Collection<Ventas> getVentasCollection() {
        return ventasCollection;
    }

    public void setVentasCollection(Collection<Ventas> ventasCollection) {
        this.ventasCollection = ventasCollection;
    }

    @XmlTransient
    public Collection<Gestion> getGestionCollection() {
        return gestionCollection;
    }

    public void setGestionCollection(Collection<Gestion> gestionCollection) {
        this.gestionCollection = gestionCollection;
    }

    @XmlTransient
    public Collection<Laboratorio> getLaboratorioCollection() {
        return laboratorioCollection;
    }

    public void setLaboratorioCollection(Collection<Laboratorio> laboratorioCollection) {
        this.laboratorioCollection = laboratorioCollection;
    }

    @XmlTransient
    public Collection<Proceso> getProcesoCollection() {
        return procesoCollection;
    }

    public void setProcesoCollection(Collection<Proceso> procesoCollection) {
        this.procesoCollection = procesoCollection;
    }

    @XmlTransient
    public Collection<Alquiler> getAlquilerCollection() {
        return alquilerCollection;
    }

    public void setAlquilerCollection(Collection<Alquiler> alquilerCollection) {
        this.alquilerCollection = alquilerCollection;
    }

    @XmlTransient
    public Collection<Mensajeria> getMensajeriaCollection() {
        return mensajeriaCollection;
    }

    public void setMensajeriaCollection(Collection<Mensajeria> mensajeriaCollection) {
        this.mensajeriaCollection = mensajeriaCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (codigo != null ? codigo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Clientes)) {
            return false;
        }
        Clientes other = (Clientes) object;
        if ((this.codigo == null && other.codigo != null) || (this.codigo != null && !this.codigo.equals(other.codigo))) {
            return false;
        }
        return true;
    }

   
    public Long toLong() {
        return  codigo ;
    }
    
}
