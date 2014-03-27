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
import formularios.Login;
import formularios.Clientes;
import formularios.Proceso;
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
public class ProcesoJpaController implements Serializable {

    public ProcesoJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
public ProcesoJpaController(){
      emf=Persistence.createEntityManagerFactory("AplicativoZComunicacionesPU");
    }
    public void create(Proceso proceso) throws PreexistingEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Login usuario = proceso.getUsuario();
            if (usuario != null) {
                usuario = em.getReference(usuario.getClass(), usuario.getUsuario());
                proceso.setUsuario(usuario);
            }
            Clientes codigoCliente = proceso.getCodigoCliente();
            if (codigoCliente != null) {
                codigoCliente = em.getReference(codigoCliente.getClass(), codigoCliente.getCodigo());
                proceso.setCodigoCliente(codigoCliente);
            }
            em.persist(proceso);
            if (usuario != null) {
                usuario.getProcesoCollection().add(proceso);
                usuario = em.merge(usuario);
            }
            if (codigoCliente != null) {
                codigoCliente.getProcesoCollection().add(proceso);
                codigoCliente = em.merge(codigoCliente);
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findProceso(proceso.getIdProceso()) != null) {
                throw new PreexistingEntityException("Proceso " + proceso + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Proceso proceso) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Proceso persistentProceso = em.find(Proceso.class, proceso.getIdProceso());
            Login usuarioOld = persistentProceso.getUsuario();
            Login usuarioNew = proceso.getUsuario();
            Clientes codigoClienteOld = persistentProceso.getCodigoCliente();
            Clientes codigoClienteNew = proceso.getCodigoCliente();
            if (usuarioNew != null) {
                usuarioNew = em.getReference(usuarioNew.getClass(), usuarioNew.getUsuario());
                proceso.setUsuario(usuarioNew);
            }
            if (codigoClienteNew != null) {
                codigoClienteNew = em.getReference(codigoClienteNew.getClass(), codigoClienteNew.getCodigo());
                proceso.setCodigoCliente(codigoClienteNew);
            }
            proceso = em.merge(proceso);
            if (usuarioOld != null && !usuarioOld.equals(usuarioNew)) {
                usuarioOld.getProcesoCollection().remove(proceso);
                usuarioOld = em.merge(usuarioOld);
            }
            if (usuarioNew != null && !usuarioNew.equals(usuarioOld)) {
                usuarioNew.getProcesoCollection().add(proceso);
                usuarioNew = em.merge(usuarioNew);
            }
            if (codigoClienteOld != null && !codigoClienteOld.equals(codigoClienteNew)) {
                codigoClienteOld.getProcesoCollection().remove(proceso);
                codigoClienteOld = em.merge(codigoClienteOld);
            }
            if (codigoClienteNew != null && !codigoClienteNew.equals(codigoClienteOld)) {
                codigoClienteNew.getProcesoCollection().add(proceso);
                codigoClienteNew = em.merge(codigoClienteNew);
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
                Integer id = proceso.getIdProceso();
                if (findProceso(id) == null) {
                    throw new NonexistentEntityException("The proceso with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(Integer id) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Proceso proceso;
            try {
                proceso = em.getReference(Proceso.class, id);
                proceso.getIdProceso();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The proceso with id " + id + " no longer exists.", enfe);
            }
            Login usuario = proceso.getUsuario();
            if (usuario != null) {
                usuario.getProcesoCollection().remove(proceso);
                usuario = em.merge(usuario);
            }
            Clientes codigoCliente = proceso.getCodigoCliente();
            if (codigoCliente != null) {
                codigoCliente.getProcesoCollection().remove(proceso);
                codigoCliente = em.merge(codigoCliente);
            }
            em.remove(proceso);
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

    public List<Proceso> findProcesoEntities() {
        return findProcesoEntities(true, -1, -1);
    }

    public List<Proceso> findProcesoEntities(int maxResults, int firstResult) {
        return findProcesoEntities(false, maxResults, firstResult);
    }

    private List<Proceso> findProcesoEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Proceso.class));
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

    public Proceso findProceso(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Proceso.class, id);
        } finally {
            em.close();
        }
    }

    public int getProcesoCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Proceso> rt = cq.from(Proceso.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
