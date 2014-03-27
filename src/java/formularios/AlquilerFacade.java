/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package formularios;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author Jhonnatan Elias Medina Agudelo
 */
@Stateless
public class AlquilerFacade extends AbstractFacade<Alquiler> {
    @PersistenceContext(unitName = "AplicativoZComunicacionesPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AlquilerFacade() {
        super(Alquiler.class);
    }
    
}
