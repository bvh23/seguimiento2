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
import formularios.Gestion;
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
public class GestionJpaController implements Serializable {

    public GestionJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
public GestionJpaController(){
      emf=Persistence.createEntityManagerFactory("AplicativoZComunicacionesPU");
    }
    public void create(Gestion gestion) throws PreexistingEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Login usuario = gestion.getUsuario();
            if (usuario != null) {
                usuario = em.getReference(usuario.getClass(), usuario.getUsuario());
                gestion.setUsuario(usuario);
            }
            Clientes codigoCliente = gestion.getCodigoCliente();
            if (codigoCliente != null) {
                codigoCliente = em.getReference(codigoCliente.getClass(), codigoCliente.getCodigo());
                gestion.setCodigoCliente(codigoCliente);
            }
            em.persist(gestion);
            if (usuario != null) {
                usuario.getGestionCollection().add(gestion);
                usuario = em.merge(usuario);
            }
            if (codigoCliente != null) {
                codigoCliente.getGestionCollection().add(gestion);
                codigoCliente = em.merge(codigoCliente);
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findGestion(gestion.getIdGestion()) != null) {
                throw new PreexistingEntityException("Gestion " + gestion + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Gestion gestion) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Gestion persistentGestion = em.find(Gestion.class, gestion.getIdGestion());
            Login usuarioOld = persistentGestion.getUsuario();
            Login usuarioNew = gestion.getUsuario();
            Clientes codigoClienteOld = persistentGestion.getCodigoCliente();
            Clientes codigoClienteNew = gestion.getCodigoCliente();
            if (usuarioNew != null) {
                usuarioNew = em.getReference(usuarioNew.getClass(), usuarioNew.getUsuario());
                gestion.setUsuario(usuarioNew);
            }
            if (codigoClienteNew != null) {
                codigoClienteNew = em.getReference(codigoClienteNew.getClass(), codigoClienteNew.getCodigo());
                gestion.setCodigoCliente(codigoClienteNew);
            }
            gestion = em.merge(gestion);
            if (usuarioOld != null && !usuarioOld.equals(usuarioNew)) {
                usuarioOld.getGestionCollection().remove(gestion);
                usuarioOld = em.merge(usuarioOld);
            }
            if (usuarioNew != null && !usuarioNew.equals(usuarioOld)) {
                usuarioNew.getGestionCollection().add(gestion);
                usuarioNew = em.merge(usuarioNew);
            }
            if (codigoClienteOld != null && !codigoClienteOld.equals(codigoClienteNew)) {
                codigoClienteOld.getGestionCollection().remove(gestion);
                codigoClienteOld = em.merge(codigoClienteOld);
            }
            if (codigoClienteNew != null && !codigoClienteNew.equals(codigoClienteOld)) {
                codigoClienteNew.getGestionCollection().add(gestion);
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
                Integer id = gestion.getIdGestion();
                if (findGestion(id) == null) {
                    throw new NonexistentEntityException("The gestion with id " + id + " no longer exists.");
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
            Gestion gestion;
            try {
                gestion = em.getReference(Gestion.class, id);
                gestion.getIdGestion();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The gestion with id " + id + " no longer exists.", enfe);
            }
            Login usuario = gestion.getUsuario();
            if (usuario != null) {
                usuario.getGestionCollection().remove(gestion);
                usuario = em.merge(usuario);
            }
            Clientes codigoCliente = gestion.getCodigoCliente();
            if (codigoCliente != null) {
                codigoCliente.getGestionCollection().remove(gestion);
                codigoCliente = em.merge(codigoCliente);
            }
            em.remove(gestion);
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

    public List<Gestion> findGestionEntities() {
        return findGestionEntities(true, -1, -1);
    }

    public List<Gestion> findGestionEntities(int maxResults, int firstResult) {
        return findGestionEntities(false, maxResults, firstResult);
    }

    private List<Gestion> findGestionEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Gestion.class));
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

    public Gestion findGestion(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Gestion.class, id);
        } finally {
            em.close();
        }
    }

    public int getGestionCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Gestion> rt = cq.from(Gestion.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
