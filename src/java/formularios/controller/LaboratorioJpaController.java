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
import formularios.Laboratorio;
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
public class LaboratorioJpaController implements Serializable {

    public LaboratorioJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
public LaboratorioJpaController(){
      emf=Persistence.createEntityManagerFactory("AplicativoZComunicacionesPU");
    }
    public void create(Laboratorio laboratorio) throws PreexistingEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Login usuario = laboratorio.getUsuario();
            if (usuario != null) {
                usuario = em.getReference(usuario.getClass(), usuario.getUsuario());
                laboratorio.setUsuario(usuario);
            }
            Clientes codigoCliente = laboratorio.getCodigoCliente();
            if (codigoCliente != null) {
                codigoCliente = em.getReference(codigoCliente.getClass(), codigoCliente.getCodigo());
                laboratorio.setCodigoCliente(codigoCliente);
            }
            em.persist(laboratorio);
            if (usuario != null) {
                usuario.getLaboratorioCollection().add(laboratorio);
                usuario = em.merge(usuario);
            }
            if (codigoCliente != null) {
                codigoCliente.getLaboratorioCollection().add(laboratorio);
                codigoCliente = em.merge(codigoCliente);
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findLaboratorio(laboratorio.getIdLaboratorio()) != null) {
                throw new PreexistingEntityException("Laboratorio " + laboratorio + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Laboratorio laboratorio) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Laboratorio persistentLaboratorio = em.find(Laboratorio.class, laboratorio.getIdLaboratorio());
            Login usuarioOld = persistentLaboratorio.getUsuario();
            Login usuarioNew = laboratorio.getUsuario();
            Clientes codigoClienteOld = persistentLaboratorio.getCodigoCliente();
            Clientes codigoClienteNew = laboratorio.getCodigoCliente();
            if (usuarioNew != null) {
                usuarioNew = em.getReference(usuarioNew.getClass(), usuarioNew.getUsuario());
                laboratorio.setUsuario(usuarioNew);
            }
            if (codigoClienteNew != null) {
                codigoClienteNew = em.getReference(codigoClienteNew.getClass(), codigoClienteNew.getCodigo());
                laboratorio.setCodigoCliente(codigoClienteNew);
            }
            laboratorio = em.merge(laboratorio);
            if (usuarioOld != null && !usuarioOld.equals(usuarioNew)) {
                usuarioOld.getLaboratorioCollection().remove(laboratorio);
                usuarioOld = em.merge(usuarioOld);
            }
            if (usuarioNew != null && !usuarioNew.equals(usuarioOld)) {
                usuarioNew.getLaboratorioCollection().add(laboratorio);
                usuarioNew = em.merge(usuarioNew);
            }
            if (codigoClienteOld != null && !codigoClienteOld.equals(codigoClienteNew)) {
                codigoClienteOld.getLaboratorioCollection().remove(laboratorio);
                codigoClienteOld = em.merge(codigoClienteOld);
            }
            if (codigoClienteNew != null && !codigoClienteNew.equals(codigoClienteOld)) {
                codigoClienteNew.getLaboratorioCollection().add(laboratorio);
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
                Integer id = laboratorio.getIdLaboratorio();
                if (findLaboratorio(id) == null) {
                    throw new NonexistentEntityException("The laboratorio with id " + id + " no longer exists.");
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
            Laboratorio laboratorio;
            try {
                laboratorio = em.getReference(Laboratorio.class, id);
                laboratorio.getIdLaboratorio();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The laboratorio with id " + id + " no longer exists.", enfe);
            }
            Login usuario = laboratorio.getUsuario();
            if (usuario != null) {
                usuario.getLaboratorioCollection().remove(laboratorio);
                usuario = em.merge(usuario);
            }
            Clientes codigoCliente = laboratorio.getCodigoCliente();
            if (codigoCliente != null) {
                codigoCliente.getLaboratorioCollection().remove(laboratorio);
                codigoCliente = em.merge(codigoCliente);
            }
            em.remove(laboratorio);
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

    public List<Laboratorio> findLaboratorioEntities() {
        return findLaboratorioEntities(true, -1, -1);
    }

    public List<Laboratorio> findLaboratorioEntities(int maxResults, int firstResult) {
        return findLaboratorioEntities(false, maxResults, firstResult);
    }

    private List<Laboratorio> findLaboratorioEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Laboratorio.class));
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

    public Laboratorio findLaboratorio(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Laboratorio.class, id);
        } finally {
            em.close();
        }
    }

    public int getLaboratorioCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Laboratorio> rt = cq.from(Laboratorio.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
