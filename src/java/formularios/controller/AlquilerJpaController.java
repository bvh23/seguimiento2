/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package formularios.controller;

import formularios.Alquiler;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import formularios.Login;
import formularios.Clientes;
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
public class AlquilerJpaController implements Serializable {

    public AlquilerJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
public AlquilerJpaController(){
      emf=Persistence.createEntityManagerFactory("AplicativoZComunicacionesPU");
    }
    public void create(Alquiler alquiler) throws PreexistingEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Login usuario = alquiler.getUsuario();
            if (usuario != null) {
                usuario = em.getReference(usuario.getClass(), usuario.getUsuario());
                alquiler.setUsuario(usuario);
            }
            Clientes codigoCliente = alquiler.getCodigoCliente();
            if (codigoCliente != null) {
                codigoCliente = em.getReference(codigoCliente.getClass(), codigoCliente.getCodigo());
                alquiler.setCodigoCliente(codigoCliente);
            }
            em.persist(alquiler);
            if (usuario != null) {
                usuario.getAlquilerCollection().add(alquiler);
                usuario = em.merge(usuario);
            }
            if (codigoCliente != null) {
                codigoCliente.getAlquilerCollection().add(alquiler);
                codigoCliente = em.merge(codigoCliente);
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("Error al intentar deshacer la transacción.", re);
            }
            if (findAlquiler(alquiler.getIdAlquiler()) != null) {
                throw new PreexistingEntityException("Alquiler " + alquiler + " ya existe.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Alquiler alquiler) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Alquiler persistentAlquiler = em.find(Alquiler.class, alquiler.getIdAlquiler());
            Login usuarioOld = persistentAlquiler.getUsuario();
            Login usuarioNew = alquiler.getUsuario();
            Clientes codigoClienteOld = persistentAlquiler.getCodigoCliente();
            Clientes codigoClienteNew = alquiler.getCodigoCliente();
            if (usuarioNew != null) {
                usuarioNew = em.getReference(usuarioNew.getClass(), usuarioNew.getUsuario());
                alquiler.setUsuario(usuarioNew);
            }
            if (codigoClienteNew != null) {
                codigoClienteNew = em.getReference(codigoClienteNew.getClass(), codigoClienteNew.getCodigo());
                alquiler.setCodigoCliente(codigoClienteNew);
            }
            alquiler = em.merge(alquiler);
            if (usuarioOld != null && !usuarioOld.equals(usuarioNew)) {
                usuarioOld.getAlquilerCollection().remove(alquiler);
                usuarioOld = em.merge(usuarioOld);
            }
            if (usuarioNew != null && !usuarioNew.equals(usuarioOld)) {
                usuarioNew.getAlquilerCollection().add(alquiler);
                usuarioNew = em.merge(usuarioNew);
            }
            if (codigoClienteOld != null && !codigoClienteOld.equals(codigoClienteNew)) {
                codigoClienteOld.getAlquilerCollection().remove(alquiler);
                codigoClienteOld = em.merge(codigoClienteOld);
            }
            if (codigoClienteNew != null && !codigoClienteNew.equals(codigoClienteOld)) {
                codigoClienteNew.getAlquilerCollection().add(alquiler);
                codigoClienteNew = em.merge(codigoClienteNew);
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("Error al intentar  deshacer la transacción.", re);
            }
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = alquiler.getIdAlquiler();
                if (findAlquiler(id) == null) {
                    throw new NonexistentEntityException("El alquiler con el id " + id + " ya no existe.");
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
            Alquiler alquiler;
            try {
                alquiler = em.getReference(Alquiler.class, id);
                alquiler.getIdAlquiler();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("El alquiler con el id " + id + " ya no existe.", enfe);
            }
            Login usuario = alquiler.getUsuario();
            if (usuario != null) {
                usuario.getAlquilerCollection().remove(alquiler);
                usuario = em.merge(usuario);
            }
            Clientes codigoCliente = alquiler.getCodigoCliente();
            if (codigoCliente != null) {
                codigoCliente.getAlquilerCollection().remove(alquiler);
                codigoCliente = em.merge(codigoCliente);
            }
            em.remove(alquiler);
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("Error al intentar  deshacer la transacción.", re);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Alquiler> findAlquilerEntities() {
        return findAlquilerEntities(true, -1, -1);
    }

    public List<Alquiler> findAlquilerEntities(int maxResults, int firstResult) {
        return findAlquilerEntities(false, maxResults, firstResult);
    }

    private List<Alquiler> findAlquilerEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Alquiler.class));
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

    public Alquiler findAlquiler(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Alquiler.class, id);
        } finally {
            em.close();
        }
    }

    public int getAlquilerCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Alquiler> rt = cq.from(Alquiler.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
