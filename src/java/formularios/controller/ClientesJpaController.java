/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package formularios.controller;

import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import formularios.Ventas;
import java.util.ArrayList;
import java.util.Collection;
import formularios.Gestion;
import formularios.Laboratorio;
import formularios.Proceso;
import formularios.Alquiler;
import formularios.Clientes;
import formularios.Mensajeria;
import formularios.controller.exceptions.IllegalOrphanException;
import formularios.controller.exceptions.NonexistentEntityException;
import formularios.controller.exceptions.PreexistingEntityException;
import formularios.controller.exceptions.RollbackFailureException;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.transaction.UserTransaction;

/**
 *
 * @author Jhonnatan Elias Medina Agudelo
 */
public class ClientesJpaController implements Serializable {

    public ClientesJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
public ClientesJpaController(){
      emf=Persistence.createEntityManagerFactory("AplicativoZComunicacionesPU");
    }
    public void create(Clientes clientes) throws PreexistingEntityException, RollbackFailureException, Exception {
        if (clientes.getVentasCollection() == null) {
            clientes.setVentasCollection(new ArrayList<Ventas>());
        }
        if (clientes.getGestionCollection() == null) {
            clientes.setGestionCollection(new ArrayList<Gestion>());
        }
        if (clientes.getLaboratorioCollection() == null) {
            clientes.setLaboratorioCollection(new ArrayList<Laboratorio>());
        }
        if (clientes.getProcesoCollection() == null) {
            clientes.setProcesoCollection(new ArrayList<Proceso>());
        }
        if (clientes.getAlquilerCollection() == null) {
            clientes.setAlquilerCollection(new ArrayList<Alquiler>());
        }
        if (clientes.getMensajeriaCollection() == null) {
            clientes.setMensajeriaCollection(new ArrayList<Mensajeria>());
        }
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Collection<Ventas> attachedVentasCollection = new ArrayList<Ventas>();
            for (Ventas ventasCollectionVentasToAttach : clientes.getVentasCollection()) {
                ventasCollectionVentasToAttach = em.getReference(ventasCollectionVentasToAttach.getClass(), ventasCollectionVentasToAttach.getIdVenta());
                attachedVentasCollection.add(ventasCollectionVentasToAttach);
            }
            clientes.setVentasCollection(attachedVentasCollection);
            Collection<Gestion> attachedGestionCollection = new ArrayList<Gestion>();
            for (Gestion gestionCollectionGestionToAttach : clientes.getGestionCollection()) {
                gestionCollectionGestionToAttach = em.getReference(gestionCollectionGestionToAttach.getClass(), gestionCollectionGestionToAttach.getIdGestion());
                attachedGestionCollection.add(gestionCollectionGestionToAttach);
            }
            clientes.setGestionCollection(attachedGestionCollection);
            Collection<Laboratorio> attachedLaboratorioCollection = new ArrayList<Laboratorio>();
            for (Laboratorio laboratorioCollectionLaboratorioToAttach : clientes.getLaboratorioCollection()) {
                laboratorioCollectionLaboratorioToAttach = em.getReference(laboratorioCollectionLaboratorioToAttach.getClass(), laboratorioCollectionLaboratorioToAttach.getIdLaboratorio());
                attachedLaboratorioCollection.add(laboratorioCollectionLaboratorioToAttach);
            }
            clientes.setLaboratorioCollection(attachedLaboratorioCollection);
            Collection<Proceso> attachedProcesoCollection = new ArrayList<Proceso>();
            for (Proceso procesoCollectionProcesoToAttach : clientes.getProcesoCollection()) {
                procesoCollectionProcesoToAttach = em.getReference(procesoCollectionProcesoToAttach.getClass(), procesoCollectionProcesoToAttach.getIdProceso());
                attachedProcesoCollection.add(procesoCollectionProcesoToAttach);
            }
            clientes.setProcesoCollection(attachedProcesoCollection);
            Collection<Alquiler> attachedAlquilerCollection = new ArrayList<Alquiler>();
            for (Alquiler alquilerCollectionAlquilerToAttach : clientes.getAlquilerCollection()) {
                alquilerCollectionAlquilerToAttach = em.getReference(alquilerCollectionAlquilerToAttach.getClass(), alquilerCollectionAlquilerToAttach.getIdAlquiler());
                attachedAlquilerCollection.add(alquilerCollectionAlquilerToAttach);
            }
            clientes.setAlquilerCollection(attachedAlquilerCollection);
            Collection<Mensajeria> attachedMensajeriaCollection = new ArrayList<Mensajeria>();
            for (Mensajeria mensajeriaCollectionMensajeriaToAttach : clientes.getMensajeriaCollection()) {
                mensajeriaCollectionMensajeriaToAttach = em.getReference(mensajeriaCollectionMensajeriaToAttach.getClass(), mensajeriaCollectionMensajeriaToAttach.getIdMensajeria());
                attachedMensajeriaCollection.add(mensajeriaCollectionMensajeriaToAttach);
            }
            clientes.setMensajeriaCollection(attachedMensajeriaCollection);
            em.persist(clientes);
            for (Ventas ventasCollectionVentas : clientes.getVentasCollection()) {
                Clientes oldCodigoClienteOfVentasCollectionVentas = ventasCollectionVentas.getCodigoCliente();
                ventasCollectionVentas.setCodigoCliente(clientes);
                ventasCollectionVentas = em.merge(ventasCollectionVentas);
                if (oldCodigoClienteOfVentasCollectionVentas != null) {
                    oldCodigoClienteOfVentasCollectionVentas.getVentasCollection().remove(ventasCollectionVentas);
                    oldCodigoClienteOfVentasCollectionVentas = em.merge(oldCodigoClienteOfVentasCollectionVentas);
                }
            }
            for (Gestion gestionCollectionGestion : clientes.getGestionCollection()) {
                Clientes oldCodigoClienteOfGestionCollectionGestion = gestionCollectionGestion.getCodigoCliente();
                gestionCollectionGestion.setCodigoCliente(clientes);
                gestionCollectionGestion = em.merge(gestionCollectionGestion);
                if (oldCodigoClienteOfGestionCollectionGestion != null) {
                    oldCodigoClienteOfGestionCollectionGestion.getGestionCollection().remove(gestionCollectionGestion);
                    oldCodigoClienteOfGestionCollectionGestion = em.merge(oldCodigoClienteOfGestionCollectionGestion);
                }
            }
            for (Laboratorio laboratorioCollectionLaboratorio : clientes.getLaboratorioCollection()) {
                Clientes oldCodigoClienteOfLaboratorioCollectionLaboratorio = laboratorioCollectionLaboratorio.getCodigoCliente();
                laboratorioCollectionLaboratorio.setCodigoCliente(clientes);
                laboratorioCollectionLaboratorio = em.merge(laboratorioCollectionLaboratorio);
                if (oldCodigoClienteOfLaboratorioCollectionLaboratorio != null) {
                    oldCodigoClienteOfLaboratorioCollectionLaboratorio.getLaboratorioCollection().remove(laboratorioCollectionLaboratorio);
                    oldCodigoClienteOfLaboratorioCollectionLaboratorio = em.merge(oldCodigoClienteOfLaboratorioCollectionLaboratorio);
                }
            }
            for (Proceso procesoCollectionProceso : clientes.getProcesoCollection()) {
                Clientes oldCodigoClienteOfProcesoCollectionProceso = procesoCollectionProceso.getCodigoCliente();
                procesoCollectionProceso.setCodigoCliente(clientes);
                procesoCollectionProceso = em.merge(procesoCollectionProceso);
                if (oldCodigoClienteOfProcesoCollectionProceso != null) {
                    oldCodigoClienteOfProcesoCollectionProceso.getProcesoCollection().remove(procesoCollectionProceso);
                    oldCodigoClienteOfProcesoCollectionProceso = em.merge(oldCodigoClienteOfProcesoCollectionProceso);
                }
            }
            for (Alquiler alquilerCollectionAlquiler : clientes.getAlquilerCollection()) {
                Clientes oldCodigoClienteOfAlquilerCollectionAlquiler = alquilerCollectionAlquiler.getCodigoCliente();
                alquilerCollectionAlquiler.setCodigoCliente(clientes);
                alquilerCollectionAlquiler = em.merge(alquilerCollectionAlquiler);
                if (oldCodigoClienteOfAlquilerCollectionAlquiler != null) {
                    oldCodigoClienteOfAlquilerCollectionAlquiler.getAlquilerCollection().remove(alquilerCollectionAlquiler);
                    oldCodigoClienteOfAlquilerCollectionAlquiler = em.merge(oldCodigoClienteOfAlquilerCollectionAlquiler);
                }
            }
            for (Mensajeria mensajeriaCollectionMensajeria : clientes.getMensajeriaCollection()) {
                Clientes oldCodigoClienteOfMensajeriaCollectionMensajeria = mensajeriaCollectionMensajeria.getCodigoCliente();
                mensajeriaCollectionMensajeria.setCodigoCliente(clientes);
                mensajeriaCollectionMensajeria = em.merge(mensajeriaCollectionMensajeria);
                if (oldCodigoClienteOfMensajeriaCollectionMensajeria != null) {
                    oldCodigoClienteOfMensajeriaCollectionMensajeria.getMensajeriaCollection().remove(mensajeriaCollectionMensajeria);
                    oldCodigoClienteOfMensajeriaCollectionMensajeria = em.merge(oldCodigoClienteOfMensajeriaCollectionMensajeria);
                }
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findClientes(clientes.getCodigo()) != null) {
                throw new PreexistingEntityException("Clientes " + clientes + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Clientes clientes) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Clientes persistentClientes = em.find(Clientes.class, clientes.getCodigo());
            Collection<Ventas> ventasCollectionOld = persistentClientes.getVentasCollection();
            Collection<Ventas> ventasCollectionNew = clientes.getVentasCollection();
            Collection<Gestion> gestionCollectionOld = persistentClientes.getGestionCollection();
            Collection<Gestion> gestionCollectionNew = clientes.getGestionCollection();
            Collection<Laboratorio> laboratorioCollectionOld = persistentClientes.getLaboratorioCollection();
            Collection<Laboratorio> laboratorioCollectionNew = clientes.getLaboratorioCollection();
            Collection<Proceso> procesoCollectionOld = persistentClientes.getProcesoCollection();
            Collection<Proceso> procesoCollectionNew = clientes.getProcesoCollection();
            Collection<Alquiler> alquilerCollectionOld = persistentClientes.getAlquilerCollection();
            Collection<Alquiler> alquilerCollectionNew = clientes.getAlquilerCollection();
            Collection<Mensajeria> mensajeriaCollectionOld = persistentClientes.getMensajeriaCollection();
            Collection<Mensajeria> mensajeriaCollectionNew = clientes.getMensajeriaCollection();
            List<String> illegalOrphanMessages = null;
            for (Ventas ventasCollectionOldVentas : ventasCollectionOld) {
                if (!ventasCollectionNew.contains(ventasCollectionOldVentas)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain Ventas " + ventasCollectionOldVentas + " since its codigoCliente field is not nullable.");
                }
            }
            for (Gestion gestionCollectionOldGestion : gestionCollectionOld) {
                if (!gestionCollectionNew.contains(gestionCollectionOldGestion)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain Gestion " + gestionCollectionOldGestion + " since its codigoCliente field is not nullable.");
                }
            }
            for (Laboratorio laboratorioCollectionOldLaboratorio : laboratorioCollectionOld) {
                if (!laboratorioCollectionNew.contains(laboratorioCollectionOldLaboratorio)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain Laboratorio " + laboratorioCollectionOldLaboratorio + " since its codigoCliente field is not nullable.");
                }
            }
            for (Proceso procesoCollectionOldProceso : procesoCollectionOld) {
                if (!procesoCollectionNew.contains(procesoCollectionOldProceso)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain Proceso " + procesoCollectionOldProceso + " since its codigoCliente field is not nullable.");
                }
            }
            for (Alquiler alquilerCollectionOldAlquiler : alquilerCollectionOld) {
                if (!alquilerCollectionNew.contains(alquilerCollectionOldAlquiler)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain Alquiler " + alquilerCollectionOldAlquiler + " since its codigoCliente field is not nullable.");
                }
            }
            for (Mensajeria mensajeriaCollectionOldMensajeria : mensajeriaCollectionOld) {
                if (!mensajeriaCollectionNew.contains(mensajeriaCollectionOldMensajeria)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain Mensajeria " + mensajeriaCollectionOldMensajeria + " since its codigoCliente field is not nullable.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            Collection<Ventas> attachedVentasCollectionNew = new ArrayList<Ventas>();
            for (Ventas ventasCollectionNewVentasToAttach : ventasCollectionNew) {
                ventasCollectionNewVentasToAttach = em.getReference(ventasCollectionNewVentasToAttach.getClass(), ventasCollectionNewVentasToAttach.getIdVenta());
                attachedVentasCollectionNew.add(ventasCollectionNewVentasToAttach);
            }
            ventasCollectionNew = attachedVentasCollectionNew;
            clientes.setVentasCollection(ventasCollectionNew);
            Collection<Gestion> attachedGestionCollectionNew = new ArrayList<Gestion>();
            for (Gestion gestionCollectionNewGestionToAttach : gestionCollectionNew) {
                gestionCollectionNewGestionToAttach = em.getReference(gestionCollectionNewGestionToAttach.getClass(), gestionCollectionNewGestionToAttach.getIdGestion());
                attachedGestionCollectionNew.add(gestionCollectionNewGestionToAttach);
            }
            gestionCollectionNew = attachedGestionCollectionNew;
            clientes.setGestionCollection(gestionCollectionNew);
            Collection<Laboratorio> attachedLaboratorioCollectionNew = new ArrayList<Laboratorio>();
            for (Laboratorio laboratorioCollectionNewLaboratorioToAttach : laboratorioCollectionNew) {
                laboratorioCollectionNewLaboratorioToAttach = em.getReference(laboratorioCollectionNewLaboratorioToAttach.getClass(), laboratorioCollectionNewLaboratorioToAttach.getIdLaboratorio());
                attachedLaboratorioCollectionNew.add(laboratorioCollectionNewLaboratorioToAttach);
            }
            laboratorioCollectionNew = attachedLaboratorioCollectionNew;
            clientes.setLaboratorioCollection(laboratorioCollectionNew);
            Collection<Proceso> attachedProcesoCollectionNew = new ArrayList<Proceso>();
            for (Proceso procesoCollectionNewProcesoToAttach : procesoCollectionNew) {
                procesoCollectionNewProcesoToAttach = em.getReference(procesoCollectionNewProcesoToAttach.getClass(), procesoCollectionNewProcesoToAttach.getIdProceso());
                attachedProcesoCollectionNew.add(procesoCollectionNewProcesoToAttach);
            }
            procesoCollectionNew = attachedProcesoCollectionNew;
            clientes.setProcesoCollection(procesoCollectionNew);
            Collection<Alquiler> attachedAlquilerCollectionNew = new ArrayList<Alquiler>();
            for (Alquiler alquilerCollectionNewAlquilerToAttach : alquilerCollectionNew) {
                alquilerCollectionNewAlquilerToAttach = em.getReference(alquilerCollectionNewAlquilerToAttach.getClass(), alquilerCollectionNewAlquilerToAttach.getIdAlquiler());
                attachedAlquilerCollectionNew.add(alquilerCollectionNewAlquilerToAttach);
            }
            alquilerCollectionNew = attachedAlquilerCollectionNew;
            clientes.setAlquilerCollection(alquilerCollectionNew);
            Collection<Mensajeria> attachedMensajeriaCollectionNew = new ArrayList<Mensajeria>();
            for (Mensajeria mensajeriaCollectionNewMensajeriaToAttach : mensajeriaCollectionNew) {
                mensajeriaCollectionNewMensajeriaToAttach = em.getReference(mensajeriaCollectionNewMensajeriaToAttach.getClass(), mensajeriaCollectionNewMensajeriaToAttach.getIdMensajeria());
                attachedMensajeriaCollectionNew.add(mensajeriaCollectionNewMensajeriaToAttach);
            }
            mensajeriaCollectionNew = attachedMensajeriaCollectionNew;
            clientes.setMensajeriaCollection(mensajeriaCollectionNew);
            clientes = em.merge(clientes);
            for (Ventas ventasCollectionNewVentas : ventasCollectionNew) {
                if (!ventasCollectionOld.contains(ventasCollectionNewVentas)) {
                    Clientes oldCodigoClienteOfVentasCollectionNewVentas = ventasCollectionNewVentas.getCodigoCliente();
                    ventasCollectionNewVentas.setCodigoCliente(clientes);
                    ventasCollectionNewVentas = em.merge(ventasCollectionNewVentas);
                    if (oldCodigoClienteOfVentasCollectionNewVentas != null && !oldCodigoClienteOfVentasCollectionNewVentas.equals(clientes)) {
                        oldCodigoClienteOfVentasCollectionNewVentas.getVentasCollection().remove(ventasCollectionNewVentas);
                        oldCodigoClienteOfVentasCollectionNewVentas = em.merge(oldCodigoClienteOfVentasCollectionNewVentas);
                    }
                }
            }
            for (Gestion gestionCollectionNewGestion : gestionCollectionNew) {
                if (!gestionCollectionOld.contains(gestionCollectionNewGestion)) {
                    Clientes oldCodigoClienteOfGestionCollectionNewGestion = gestionCollectionNewGestion.getCodigoCliente();
                    gestionCollectionNewGestion.setCodigoCliente(clientes);
                    gestionCollectionNewGestion = em.merge(gestionCollectionNewGestion);
                    if (oldCodigoClienteOfGestionCollectionNewGestion != null && !oldCodigoClienteOfGestionCollectionNewGestion.equals(clientes)) {
                        oldCodigoClienteOfGestionCollectionNewGestion.getGestionCollection().remove(gestionCollectionNewGestion);
                        oldCodigoClienteOfGestionCollectionNewGestion = em.merge(oldCodigoClienteOfGestionCollectionNewGestion);
                    }
                }
            }
            for (Laboratorio laboratorioCollectionNewLaboratorio : laboratorioCollectionNew) {
                if (!laboratorioCollectionOld.contains(laboratorioCollectionNewLaboratorio)) {
                    Clientes oldCodigoClienteOfLaboratorioCollectionNewLaboratorio = laboratorioCollectionNewLaboratorio.getCodigoCliente();
                    laboratorioCollectionNewLaboratorio.setCodigoCliente(clientes);
                    laboratorioCollectionNewLaboratorio = em.merge(laboratorioCollectionNewLaboratorio);
                    if (oldCodigoClienteOfLaboratorioCollectionNewLaboratorio != null && !oldCodigoClienteOfLaboratorioCollectionNewLaboratorio.equals(clientes)) {
                        oldCodigoClienteOfLaboratorioCollectionNewLaboratorio.getLaboratorioCollection().remove(laboratorioCollectionNewLaboratorio);
                        oldCodigoClienteOfLaboratorioCollectionNewLaboratorio = em.merge(oldCodigoClienteOfLaboratorioCollectionNewLaboratorio);
                    }
                }
            }
            for (Proceso procesoCollectionNewProceso : procesoCollectionNew) {
                if (!procesoCollectionOld.contains(procesoCollectionNewProceso)) {
                    Clientes oldCodigoClienteOfProcesoCollectionNewProceso = procesoCollectionNewProceso.getCodigoCliente();
                    procesoCollectionNewProceso.setCodigoCliente(clientes);
                    procesoCollectionNewProceso = em.merge(procesoCollectionNewProceso);
                    if (oldCodigoClienteOfProcesoCollectionNewProceso != null && !oldCodigoClienteOfProcesoCollectionNewProceso.equals(clientes)) {
                        oldCodigoClienteOfProcesoCollectionNewProceso.getProcesoCollection().remove(procesoCollectionNewProceso);
                        oldCodigoClienteOfProcesoCollectionNewProceso = em.merge(oldCodigoClienteOfProcesoCollectionNewProceso);
                    }
                }
            }
            for (Alquiler alquilerCollectionNewAlquiler : alquilerCollectionNew) {
                if (!alquilerCollectionOld.contains(alquilerCollectionNewAlquiler)) {
                    Clientes oldCodigoClienteOfAlquilerCollectionNewAlquiler = alquilerCollectionNewAlquiler.getCodigoCliente();
                    alquilerCollectionNewAlquiler.setCodigoCliente(clientes);
                    alquilerCollectionNewAlquiler = em.merge(alquilerCollectionNewAlquiler);
                    if (oldCodigoClienteOfAlquilerCollectionNewAlquiler != null && !oldCodigoClienteOfAlquilerCollectionNewAlquiler.equals(clientes)) {
                        oldCodigoClienteOfAlquilerCollectionNewAlquiler.getAlquilerCollection().remove(alquilerCollectionNewAlquiler);
                        oldCodigoClienteOfAlquilerCollectionNewAlquiler = em.merge(oldCodigoClienteOfAlquilerCollectionNewAlquiler);
                    }
                }
            }
            for (Mensajeria mensajeriaCollectionNewMensajeria : mensajeriaCollectionNew) {
                if (!mensajeriaCollectionOld.contains(mensajeriaCollectionNewMensajeria)) {
                    Clientes oldCodigoClienteOfMensajeriaCollectionNewMensajeria = mensajeriaCollectionNewMensajeria.getCodigoCliente();
                    mensajeriaCollectionNewMensajeria.setCodigoCliente(clientes);
                    mensajeriaCollectionNewMensajeria = em.merge(mensajeriaCollectionNewMensajeria);
                    if (oldCodigoClienteOfMensajeriaCollectionNewMensajeria != null && !oldCodigoClienteOfMensajeriaCollectionNewMensajeria.equals(clientes)) {
                        oldCodigoClienteOfMensajeriaCollectionNewMensajeria.getMensajeriaCollection().remove(mensajeriaCollectionNewMensajeria);
                        oldCodigoClienteOfMensajeriaCollectionNewMensajeria = em.merge(oldCodigoClienteOfMensajeriaCollectionNewMensajeria);
                    }
                }
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Long id = clientes.getCodigo();
                if (findClientes(id) == null) {
                    throw new NonexistentEntityException("The clientes with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(Long id) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Clientes clientes;
            try {
                clientes = em.getReference(Clientes.class, id);
                clientes.getCodigo();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The clientes with id " + id + " no longer exists.", enfe);
            }
            List<String> illegalOrphanMessages = null;
            Collection<Ventas> ventasCollectionOrphanCheck = clientes.getVentasCollection();
            for (Ventas ventasCollectionOrphanCheckVentas : ventasCollectionOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Clientes (" + clientes + ") cannot be destroyed since the Ventas " + ventasCollectionOrphanCheckVentas + " in its ventasCollection field has a non-nullable codigoCliente field.");
            }
            Collection<Gestion> gestionCollectionOrphanCheck = clientes.getGestionCollection();
            for (Gestion gestionCollectionOrphanCheckGestion : gestionCollectionOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Clientes (" + clientes + ") cannot be destroyed since the Gestion " + gestionCollectionOrphanCheckGestion + " in its gestionCollection field has a non-nullable codigoCliente field.");
            }
            Collection<Laboratorio> laboratorioCollectionOrphanCheck = clientes.getLaboratorioCollection();
            for (Laboratorio laboratorioCollectionOrphanCheckLaboratorio : laboratorioCollectionOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Clientes (" + clientes + ") cannot be destroyed since the Laboratorio " + laboratorioCollectionOrphanCheckLaboratorio + " in its laboratorioCollection field has a non-nullable codigoCliente field.");
            }
            Collection<Proceso> procesoCollectionOrphanCheck = clientes.getProcesoCollection();
            for (Proceso procesoCollectionOrphanCheckProceso : procesoCollectionOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Clientes (" + clientes + ") cannot be destroyed since the Proceso " + procesoCollectionOrphanCheckProceso + " in its procesoCollection field has a non-nullable codigoCliente field.");
            }
            Collection<Alquiler> alquilerCollectionOrphanCheck = clientes.getAlquilerCollection();
            for (Alquiler alquilerCollectionOrphanCheckAlquiler : alquilerCollectionOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Clientes (" + clientes + ") cannot be destroyed since the Alquiler " + alquilerCollectionOrphanCheckAlquiler + " in its alquilerCollection field has a non-nullable codigoCliente field.");
            }
            Collection<Mensajeria> mensajeriaCollectionOrphanCheck = clientes.getMensajeriaCollection();
            for (Mensajeria mensajeriaCollectionOrphanCheckMensajeria : mensajeriaCollectionOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Clientes (" + clientes + ") cannot be destroyed since the Mensajeria " + mensajeriaCollectionOrphanCheckMensajeria + " in its mensajeriaCollection field has a non-nullable codigoCliente field.");
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            em.remove(clientes);
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Clientes> findClientesEntities() {
        return findClientesEntities(true, -1, -1);
    }

    public List<Clientes> findClientesEntities(int maxResults, int firstResult) {
        return findClientesEntities(false, maxResults, firstResult);
    }

    private List<Clientes> findClientesEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Clientes.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public Clientes findClientes(Long id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Clientes.class, id);
        } finally {
            em.close();
        }
    }

    public int getClientesCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Clientes> rt = cq.from(Clientes.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
