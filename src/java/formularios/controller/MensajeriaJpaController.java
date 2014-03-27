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
import formularios.Mensajeria;
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
public class MensajeriaJpaController implements Serializable {

    public MensajeriaJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
public MensajeriaJpaController(){
      emf=Persistence.createEntityManagerFactory("AplicativoZComunicacionesPU");
    }
    public void create(Mensajeria mensajeria) throws PreexistingEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Login usuario = mensajeria.getUsuario();
            if (usuario != null) {
                usuario = em.getReference(usuario.getClass(), usuario.getUsuario());
                mensajeria.setUsuario(usuario);
            }
            Clientes codigoCliente = mensajeria.getCodigoCliente();
            if (codigoCliente != null) {
                codigoCliente = em.getReference(codigoCliente.getClass(), codigoCliente.getCodigo());
                mensajeria.setCodigoCliente(codigoCliente);
            }
            em.persist(mensajeria);
            if (usuario != null) {
                usuario.getMensajeriaCollection().add(mensajeria);
                usuario = em.merge(usuario);
            }
            if (codigoCliente != null) {
                codigoCliente.getMensajeriaCollection().add(mensajeria);
                codigoCliente = em.merge(codigoCliente);
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findMensajeria(mensajeria.getIdMensajeria()) != null) {
                throw new PreexistingEntityException("Mensajeria " + mensajeria + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Mensajeria mensajeria) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Mensajeria persistentMensajeria = em.find(Mensajeria.class, mensajeria.getIdMensajeria());
            Login usuarioOld = persistentMensajeria.getUsuario();
            Login usuarioNew = mensajeria.getUsuario();
            Clientes codigoClienteOld = persistentMensajeria.getCodigoCliente();
            Clientes codigoClienteNew = mensajeria.getCodigoCliente();
            if (usuarioNew != null) {
                usuarioNew = em.getReference(usuarioNew.getClass(), usuarioNew.getUsuario());
                mensajeria.setUsuario(usuarioNew);
            }
            if (codigoClienteNew != null) {
                codigoClienteNew = em.getReference(codigoClienteNew.getClass(), codigoClienteNew.getCodigo());
                mensajeria.setCodigoCliente(codigoClienteNew);
            }
            mensajeria = em.merge(mensajeria);
            if (usuarioOld != null && !usuarioOld.equals(usuarioNew)) {
                usuarioOld.getMensajeriaCollection().remove(mensajeria);
                usuarioOld = em.merge(usuarioOld);
            }
            if (usuarioNew != null && !usuarioNew.equals(usuarioOld)) {
                usuarioNew.getMensajeriaCollection().add(mensajeria);
                usuarioNew = em.merge(usuarioNew);
            }
            if (codigoClienteOld != null && !codigoClienteOld.equals(codigoClienteNew)) {
                codigoClienteOld.getMensajeriaCollection().remove(mensajeria);
                codigoClienteOld = em.merge(codigoClienteOld);
            }
            if (codigoClienteNew != null && !codigoClienteNew.equals(codigoClienteOld)) {
                codigoClienteNew.getMensajeriaCollection().add(mensajeria);
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
                Integer id = mensajeria.getIdMensajeria();
                if (findMensajeria(id) == null) {
                    throw new NonexistentEntityException("The mensajeria with id " + id + " no longer exists.");
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
            Mensajeria mensajeria;
            try {
                mensajeria = em.getReference(Mensajeria.class, id);
                mensajeria.getIdMensajeria();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The mensajeria with id " + id + " no longer exists.", enfe);
            }
            Login usuario = mensajeria.getUsuario();
            if (usuario != null) {
                usuario.getMensajeriaCollection().remove(mensajeria);
                usuario = em.merge(usuario);
            }
            Clientes codigoCliente = mensajeria.getCodigoCliente();
            if (codigoCliente != null) {
                codigoCliente.getMensajeriaCollection().remove(mensajeria);
                codigoCliente = em.merge(codigoCliente);
            }
            em.remove(mensajeria);
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

    public List<Mensajeria> findMensajeriaEntities() {
        return findMensajeriaEntities(true, -1, -1);
    }

    public List<Mensajeria> findMensajeriaEntities(int maxResults, int firstResult) {
        return findMensajeriaEntities(false, maxResults, firstResult);
    }

    private List<Mensajeria> findMensajeriaEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Mensajeria.class));
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

    public Mensajeria findMensajeria(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Mensajeria.class, id);
        } finally {
            em.close();
        }
    }

    public int getMensajeriaCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Mensajeria> rt = cq.from(Mensajeria.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
