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
import formularios.Login;
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
public class LoginJpaController implements Serializable {

    public LoginJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
public LoginJpaController(){
      emf=Persistence.createEntityManagerFactory("AplicativoZComunicacionesPU");
    }
    public void create(Login login) throws PreexistingEntityException, RollbackFailureException, Exception {
        if (login.getVentasCollection() == null) {
            login.setVentasCollection(new ArrayList<Ventas>());
        }
        if (login.getGestionCollection() == null) {
            login.setGestionCollection(new ArrayList<Gestion>());
        }
        if (login.getLaboratorioCollection() == null) {
            login.setLaboratorioCollection(new ArrayList<Laboratorio>());
        }
        if (login.getProcesoCollection() == null) {
            login.setProcesoCollection(new ArrayList<Proceso>());
        }
        if (login.getAlquilerCollection() == null) {
            login.setAlquilerCollection(new ArrayList<Alquiler>());
        }
        if (login.getMensajeriaCollection() == null) {
            login.setMensajeriaCollection(new ArrayList<Mensajeria>());
        }
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Collection<Ventas> attachedVentasCollection = new ArrayList<Ventas>();
            for (Ventas ventasCollectionVentasToAttach : login.getVentasCollection()) {
                ventasCollectionVentasToAttach = em.getReference(ventasCollectionVentasToAttach.getClass(), ventasCollectionVentasToAttach.getIdVenta());
                attachedVentasCollection.add(ventasCollectionVentasToAttach);
            }
            login.setVentasCollection(attachedVentasCollection);
            Collection<Gestion> attachedGestionCollection = new ArrayList<Gestion>();
            for (Gestion gestionCollectionGestionToAttach : login.getGestionCollection()) {
                gestionCollectionGestionToAttach = em.getReference(gestionCollectionGestionToAttach.getClass(), gestionCollectionGestionToAttach.getIdGestion());
                attachedGestionCollection.add(gestionCollectionGestionToAttach);
            }
            login.setGestionCollection(attachedGestionCollection);
            Collection<Laboratorio> attachedLaboratorioCollection = new ArrayList<Laboratorio>();
            for (Laboratorio laboratorioCollectionLaboratorioToAttach : login.getLaboratorioCollection()) {
                laboratorioCollectionLaboratorioToAttach = em.getReference(laboratorioCollectionLaboratorioToAttach.getClass(), laboratorioCollectionLaboratorioToAttach.getIdLaboratorio());
                attachedLaboratorioCollection.add(laboratorioCollectionLaboratorioToAttach);
            }
            login.setLaboratorioCollection(attachedLaboratorioCollection);
            Collection<Proceso> attachedProcesoCollection = new ArrayList<Proceso>();
            for (Proceso procesoCollectionProcesoToAttach : login.getProcesoCollection()) {
                procesoCollectionProcesoToAttach = em.getReference(procesoCollectionProcesoToAttach.getClass(), procesoCollectionProcesoToAttach.getIdProceso());
                attachedProcesoCollection.add(procesoCollectionProcesoToAttach);
            }
            login.setProcesoCollection(attachedProcesoCollection);
            Collection<Alquiler> attachedAlquilerCollection = new ArrayList<Alquiler>();
            for (Alquiler alquilerCollectionAlquilerToAttach : login.getAlquilerCollection()) {
                alquilerCollectionAlquilerToAttach = em.getReference(alquilerCollectionAlquilerToAttach.getClass(), alquilerCollectionAlquilerToAttach.getIdAlquiler());
                attachedAlquilerCollection.add(alquilerCollectionAlquilerToAttach);
            }
            login.setAlquilerCollection(attachedAlquilerCollection);
            Collection<Mensajeria> attachedMensajeriaCollection = new ArrayList<Mensajeria>();
            for (Mensajeria mensajeriaCollectionMensajeriaToAttach : login.getMensajeriaCollection()) {
                mensajeriaCollectionMensajeriaToAttach = em.getReference(mensajeriaCollectionMensajeriaToAttach.getClass(), mensajeriaCollectionMensajeriaToAttach.getIdMensajeria());
                attachedMensajeriaCollection.add(mensajeriaCollectionMensajeriaToAttach);
            }
            login.setMensajeriaCollection(attachedMensajeriaCollection);
            em.persist(login);
            for (Ventas ventasCollectionVentas : login.getVentasCollection()) {
                Login oldUsuarioOfVentasCollectionVentas = ventasCollectionVentas.getUsuario();
                ventasCollectionVentas.setUsuario(login);
                ventasCollectionVentas = em.merge(ventasCollectionVentas);
                if (oldUsuarioOfVentasCollectionVentas != null) {
                    oldUsuarioOfVentasCollectionVentas.getVentasCollection().remove(ventasCollectionVentas);
                    oldUsuarioOfVentasCollectionVentas = em.merge(oldUsuarioOfVentasCollectionVentas);
                }
            }
            for (Gestion gestionCollectionGestion : login.getGestionCollection()) {
                Login oldUsuarioOfGestionCollectionGestion = gestionCollectionGestion.getUsuario();
                gestionCollectionGestion.setUsuario(login);
                gestionCollectionGestion = em.merge(gestionCollectionGestion);
                if (oldUsuarioOfGestionCollectionGestion != null) {
                    oldUsuarioOfGestionCollectionGestion.getGestionCollection().remove(gestionCollectionGestion);
                    oldUsuarioOfGestionCollectionGestion = em.merge(oldUsuarioOfGestionCollectionGestion);
                }
            }
            for (Laboratorio laboratorioCollectionLaboratorio : login.getLaboratorioCollection()) {
                Login oldUsuarioOfLaboratorioCollectionLaboratorio = laboratorioCollectionLaboratorio.getUsuario();
                laboratorioCollectionLaboratorio.setUsuario(login);
                laboratorioCollectionLaboratorio = em.merge(laboratorioCollectionLaboratorio);
                if (oldUsuarioOfLaboratorioCollectionLaboratorio != null) {
                    oldUsuarioOfLaboratorioCollectionLaboratorio.getLaboratorioCollection().remove(laboratorioCollectionLaboratorio);
                    oldUsuarioOfLaboratorioCollectionLaboratorio = em.merge(oldUsuarioOfLaboratorioCollectionLaboratorio);
                }
            }
            for (Proceso procesoCollectionProceso : login.getProcesoCollection()) {
                Login oldUsuarioOfProcesoCollectionProceso = procesoCollectionProceso.getUsuario();
                procesoCollectionProceso.setUsuario(login);
                procesoCollectionProceso = em.merge(procesoCollectionProceso);
                if (oldUsuarioOfProcesoCollectionProceso != null) {
                    oldUsuarioOfProcesoCollectionProceso.getProcesoCollection().remove(procesoCollectionProceso);
                    oldUsuarioOfProcesoCollectionProceso = em.merge(oldUsuarioOfProcesoCollectionProceso);
                }
            }
            for (Alquiler alquilerCollectionAlquiler : login.getAlquilerCollection()) {
                Login oldUsuarioOfAlquilerCollectionAlquiler = alquilerCollectionAlquiler.getUsuario();
                alquilerCollectionAlquiler.setUsuario(login);
                alquilerCollectionAlquiler = em.merge(alquilerCollectionAlquiler);
                if (oldUsuarioOfAlquilerCollectionAlquiler != null) {
                    oldUsuarioOfAlquilerCollectionAlquiler.getAlquilerCollection().remove(alquilerCollectionAlquiler);
                    oldUsuarioOfAlquilerCollectionAlquiler = em.merge(oldUsuarioOfAlquilerCollectionAlquiler);
                }
            }
            for (Mensajeria mensajeriaCollectionMensajeria : login.getMensajeriaCollection()) {
                Login oldUsuarioOfMensajeriaCollectionMensajeria = mensajeriaCollectionMensajeria.getUsuario();
                mensajeriaCollectionMensajeria.setUsuario(login);
                mensajeriaCollectionMensajeria = em.merge(mensajeriaCollectionMensajeria);
                if (oldUsuarioOfMensajeriaCollectionMensajeria != null) {
                    oldUsuarioOfMensajeriaCollectionMensajeria.getMensajeriaCollection().remove(mensajeriaCollectionMensajeria);
                    oldUsuarioOfMensajeriaCollectionMensajeria = em.merge(oldUsuarioOfMensajeriaCollectionMensajeria);
                }
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findLogin(login.getUsuario()) != null) {
                throw new PreexistingEntityException("Login " + login + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Login login) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Login persistentLogin = em.find(Login.class, login.getUsuario());
            Collection<Ventas> ventasCollectionOld = persistentLogin.getVentasCollection();
            Collection<Ventas> ventasCollectionNew = login.getVentasCollection();
            Collection<Gestion> gestionCollectionOld = persistentLogin.getGestionCollection();
            Collection<Gestion> gestionCollectionNew = login.getGestionCollection();
            Collection<Laboratorio> laboratorioCollectionOld = persistentLogin.getLaboratorioCollection();
            Collection<Laboratorio> laboratorioCollectionNew = login.getLaboratorioCollection();
            Collection<Proceso> procesoCollectionOld = persistentLogin.getProcesoCollection();
            Collection<Proceso> procesoCollectionNew = login.getProcesoCollection();
            Collection<Alquiler> alquilerCollectionOld = persistentLogin.getAlquilerCollection();
            Collection<Alquiler> alquilerCollectionNew = login.getAlquilerCollection();
            Collection<Mensajeria> mensajeriaCollectionOld = persistentLogin.getMensajeriaCollection();
            Collection<Mensajeria> mensajeriaCollectionNew = login.getMensajeriaCollection();
            List<String> illegalOrphanMessages = null;
            for (Ventas ventasCollectionOldVentas : ventasCollectionOld) {
                if (!ventasCollectionNew.contains(ventasCollectionOldVentas)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain Ventas " + ventasCollectionOldVentas + " since its usuario field is not nullable.");
                }
            }
            for (Gestion gestionCollectionOldGestion : gestionCollectionOld) {
                if (!gestionCollectionNew.contains(gestionCollectionOldGestion)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain Gestion " + gestionCollectionOldGestion + " since its usuario field is not nullable.");
                }
            }
            for (Laboratorio laboratorioCollectionOldLaboratorio : laboratorioCollectionOld) {
                if (!laboratorioCollectionNew.contains(laboratorioCollectionOldLaboratorio)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain Laboratorio " + laboratorioCollectionOldLaboratorio + " since its usuario field is not nullable.");
                }
            }
            for (Proceso procesoCollectionOldProceso : procesoCollectionOld) {
                if (!procesoCollectionNew.contains(procesoCollectionOldProceso)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain Proceso " + procesoCollectionOldProceso + " since its usuario field is not nullable.");
                }
            }
            for (Alquiler alquilerCollectionOldAlquiler : alquilerCollectionOld) {
                if (!alquilerCollectionNew.contains(alquilerCollectionOldAlquiler)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain Alquiler " + alquilerCollectionOldAlquiler + " since its usuario field is not nullable.");
                }
            }
            for (Mensajeria mensajeriaCollectionOldMensajeria : mensajeriaCollectionOld) {
                if (!mensajeriaCollectionNew.contains(mensajeriaCollectionOldMensajeria)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain Mensajeria " + mensajeriaCollectionOldMensajeria + " since its usuario field is not nullable.");
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
            login.setVentasCollection(ventasCollectionNew);
            Collection<Gestion> attachedGestionCollectionNew = new ArrayList<Gestion>();
            for (Gestion gestionCollectionNewGestionToAttach : gestionCollectionNew) {
                gestionCollectionNewGestionToAttach = em.getReference(gestionCollectionNewGestionToAttach.getClass(), gestionCollectionNewGestionToAttach.getIdGestion());
                attachedGestionCollectionNew.add(gestionCollectionNewGestionToAttach);
            }
            gestionCollectionNew = attachedGestionCollectionNew;
            login.setGestionCollection(gestionCollectionNew);
            Collection<Laboratorio> attachedLaboratorioCollectionNew = new ArrayList<Laboratorio>();
            for (Laboratorio laboratorioCollectionNewLaboratorioToAttach : laboratorioCollectionNew) {
                laboratorioCollectionNewLaboratorioToAttach = em.getReference(laboratorioCollectionNewLaboratorioToAttach.getClass(), laboratorioCollectionNewLaboratorioToAttach.getIdLaboratorio());
                attachedLaboratorioCollectionNew.add(laboratorioCollectionNewLaboratorioToAttach);
            }
            laboratorioCollectionNew = attachedLaboratorioCollectionNew;
            login.setLaboratorioCollection(laboratorioCollectionNew);
            Collection<Proceso> attachedProcesoCollectionNew = new ArrayList<Proceso>();
            for (Proceso procesoCollectionNewProcesoToAttach : procesoCollectionNew) {
                procesoCollectionNewProcesoToAttach = em.getReference(procesoCollectionNewProcesoToAttach.getClass(), procesoCollectionNewProcesoToAttach.getIdProceso());
                attachedProcesoCollectionNew.add(procesoCollectionNewProcesoToAttach);
            }
            procesoCollectionNew = attachedProcesoCollectionNew;
            login.setProcesoCollection(procesoCollectionNew);
            Collection<Alquiler> attachedAlquilerCollectionNew = new ArrayList<Alquiler>();
            for (Alquiler alquilerCollectionNewAlquilerToAttach : alquilerCollectionNew) {
                alquilerCollectionNewAlquilerToAttach = em.getReference(alquilerCollectionNewAlquilerToAttach.getClass(), alquilerCollectionNewAlquilerToAttach.getIdAlquiler());
                attachedAlquilerCollectionNew.add(alquilerCollectionNewAlquilerToAttach);
            }
            alquilerCollectionNew = attachedAlquilerCollectionNew;
            login.setAlquilerCollection(alquilerCollectionNew);
            Collection<Mensajeria> attachedMensajeriaCollectionNew = new ArrayList<Mensajeria>();
            for (Mensajeria mensajeriaCollectionNewMensajeriaToAttach : mensajeriaCollectionNew) {
                mensajeriaCollectionNewMensajeriaToAttach = em.getReference(mensajeriaCollectionNewMensajeriaToAttach.getClass(), mensajeriaCollectionNewMensajeriaToAttach.getIdMensajeria());
                attachedMensajeriaCollectionNew.add(mensajeriaCollectionNewMensajeriaToAttach);
            }
            mensajeriaCollectionNew = attachedMensajeriaCollectionNew;
            login.setMensajeriaCollection(mensajeriaCollectionNew);
            login = em.merge(login);
            for (Ventas ventasCollectionNewVentas : ventasCollectionNew) {
                if (!ventasCollectionOld.contains(ventasCollectionNewVentas)) {
                    Login oldUsuarioOfVentasCollectionNewVentas = ventasCollectionNewVentas.getUsuario();
                    ventasCollectionNewVentas.setUsuario(login);
                    ventasCollectionNewVentas = em.merge(ventasCollectionNewVentas);
                    if (oldUsuarioOfVentasCollectionNewVentas != null && !oldUsuarioOfVentasCollectionNewVentas.equals(login)) {
                        oldUsuarioOfVentasCollectionNewVentas.getVentasCollection().remove(ventasCollectionNewVentas);
                        oldUsuarioOfVentasCollectionNewVentas = em.merge(oldUsuarioOfVentasCollectionNewVentas);
                    }
                }
            }
            for (Gestion gestionCollectionNewGestion : gestionCollectionNew) {
                if (!gestionCollectionOld.contains(gestionCollectionNewGestion)) {
                    Login oldUsuarioOfGestionCollectionNewGestion = gestionCollectionNewGestion.getUsuario();
                    gestionCollectionNewGestion.setUsuario(login);
                    gestionCollectionNewGestion = em.merge(gestionCollectionNewGestion);
                    if (oldUsuarioOfGestionCollectionNewGestion != null && !oldUsuarioOfGestionCollectionNewGestion.equals(login)) {
                        oldUsuarioOfGestionCollectionNewGestion.getGestionCollection().remove(gestionCollectionNewGestion);
                        oldUsuarioOfGestionCollectionNewGestion = em.merge(oldUsuarioOfGestionCollectionNewGestion);
                    }
                }
            }
            for (Laboratorio laboratorioCollectionNewLaboratorio : laboratorioCollectionNew) {
                if (!laboratorioCollectionOld.contains(laboratorioCollectionNewLaboratorio)) {
                    Login oldUsuarioOfLaboratorioCollectionNewLaboratorio = laboratorioCollectionNewLaboratorio.getUsuario();
                    laboratorioCollectionNewLaboratorio.setUsuario(login);
                    laboratorioCollectionNewLaboratorio = em.merge(laboratorioCollectionNewLaboratorio);
                    if (oldUsuarioOfLaboratorioCollectionNewLaboratorio != null && !oldUsuarioOfLaboratorioCollectionNewLaboratorio.equals(login)) {
                        oldUsuarioOfLaboratorioCollectionNewLaboratorio.getLaboratorioCollection().remove(laboratorioCollectionNewLaboratorio);
                        oldUsuarioOfLaboratorioCollectionNewLaboratorio = em.merge(oldUsuarioOfLaboratorioCollectionNewLaboratorio);
                    }
                }
            }
            for (Proceso procesoCollectionNewProceso : procesoCollectionNew) {
                if (!procesoCollectionOld.contains(procesoCollectionNewProceso)) {
                    Login oldUsuarioOfProcesoCollectionNewProceso = procesoCollectionNewProceso.getUsuario();
                    procesoCollectionNewProceso.setUsuario(login);
                    procesoCollectionNewProceso = em.merge(procesoCollectionNewProceso);
                    if (oldUsuarioOfProcesoCollectionNewProceso != null && !oldUsuarioOfProcesoCollectionNewProceso.equals(login)) {
                        oldUsuarioOfProcesoCollectionNewProceso.getProcesoCollection().remove(procesoCollectionNewProceso);
                        oldUsuarioOfProcesoCollectionNewProceso = em.merge(oldUsuarioOfProcesoCollectionNewProceso);
                    }
                }
            }
            for (Alquiler alquilerCollectionNewAlquiler : alquilerCollectionNew) {
                if (!alquilerCollectionOld.contains(alquilerCollectionNewAlquiler)) {
                    Login oldUsuarioOfAlquilerCollectionNewAlquiler = alquilerCollectionNewAlquiler.getUsuario();
                    alquilerCollectionNewAlquiler.setUsuario(login);
                    alquilerCollectionNewAlquiler = em.merge(alquilerCollectionNewAlquiler);
                    if (oldUsuarioOfAlquilerCollectionNewAlquiler != null && !oldUsuarioOfAlquilerCollectionNewAlquiler.equals(login)) {
                        oldUsuarioOfAlquilerCollectionNewAlquiler.getAlquilerCollection().remove(alquilerCollectionNewAlquiler);
                        oldUsuarioOfAlquilerCollectionNewAlquiler = em.merge(oldUsuarioOfAlquilerCollectionNewAlquiler);
                    }
                }
            }
            for (Mensajeria mensajeriaCollectionNewMensajeria : mensajeriaCollectionNew) {
                if (!mensajeriaCollectionOld.contains(mensajeriaCollectionNewMensajeria)) {
                    Login oldUsuarioOfMensajeriaCollectionNewMensajeria = mensajeriaCollectionNewMensajeria.getUsuario();
                    mensajeriaCollectionNewMensajeria.setUsuario(login);
                    mensajeriaCollectionNewMensajeria = em.merge(mensajeriaCollectionNewMensajeria);
                    if (oldUsuarioOfMensajeriaCollectionNewMensajeria != null && !oldUsuarioOfMensajeriaCollectionNewMensajeria.equals(login)) {
                        oldUsuarioOfMensajeriaCollectionNewMensajeria.getMensajeriaCollection().remove(mensajeriaCollectionNewMensajeria);
                        oldUsuarioOfMensajeriaCollectionNewMensajeria = em.merge(oldUsuarioOfMensajeriaCollectionNewMensajeria);
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
                String id = login.getUsuario();
                if (findLogin(id) == null) {
                    throw new NonexistentEntityException("The login with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(String id) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Login login;
            try {
                login = em.getReference(Login.class, id);
                login.getUsuario();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The login with id " + id + " no longer exists.", enfe);
            }
            List<String> illegalOrphanMessages = null;
            Collection<Ventas> ventasCollectionOrphanCheck = login.getVentasCollection();
            for (Ventas ventasCollectionOrphanCheckVentas : ventasCollectionOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Login (" + login + ") cannot be destroyed since the Ventas " + ventasCollectionOrphanCheckVentas + " in its ventasCollection field has a non-nullable usuario field.");
            }
            Collection<Gestion> gestionCollectionOrphanCheck = login.getGestionCollection();
            for (Gestion gestionCollectionOrphanCheckGestion : gestionCollectionOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Login (" + login + ") cannot be destroyed since the Gestion " + gestionCollectionOrphanCheckGestion + " in its gestionCollection field has a non-nullable usuario field.");
            }
            Collection<Laboratorio> laboratorioCollectionOrphanCheck = login.getLaboratorioCollection();
            for (Laboratorio laboratorioCollectionOrphanCheckLaboratorio : laboratorioCollectionOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Login (" + login + ") cannot be destroyed since the Laboratorio " + laboratorioCollectionOrphanCheckLaboratorio + " in its laboratorioCollection field has a non-nullable usuario field.");
            }
            Collection<Proceso> procesoCollectionOrphanCheck = login.getProcesoCollection();
            for (Proceso procesoCollectionOrphanCheckProceso : procesoCollectionOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Login (" + login + ") cannot be destroyed since the Proceso " + procesoCollectionOrphanCheckProceso + " in its procesoCollection field has a non-nullable usuario field.");
            }
            Collection<Alquiler> alquilerCollectionOrphanCheck = login.getAlquilerCollection();
            for (Alquiler alquilerCollectionOrphanCheckAlquiler : alquilerCollectionOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Login (" + login + ") cannot be destroyed since the Alquiler " + alquilerCollectionOrphanCheckAlquiler + " in its alquilerCollection field has a non-nullable usuario field.");
            }
            Collection<Mensajeria> mensajeriaCollectionOrphanCheck = login.getMensajeriaCollection();
            for (Mensajeria mensajeriaCollectionOrphanCheckMensajeria : mensajeriaCollectionOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Login (" + login + ") cannot be destroyed since the Mensajeria " + mensajeriaCollectionOrphanCheckMensajeria + " in its mensajeriaCollection field has a non-nullable usuario field.");
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            em.remove(login);
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

    public List<Login> findLoginEntities() {
        return findLoginEntities(true, -1, -1);
    }

    public List<Login> findLoginEntities(int maxResults, int firstResult) {
        return findLoginEntities(false, maxResults, firstResult);
    }

    private List<Login> findLoginEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Login.class));
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

    public Login findLogin(String id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Login.class, id);
        } finally {
            em.close();
        }
    }

    public int getLoginCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Login> rt = cq.from(Login.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
