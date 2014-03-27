/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package formularios;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import javax.faces.FacesException;
import javax.annotation.Resource;
import javax.transaction.UserTransaction;
import formularios.util.JsfUtil;
import formularios.util.PagingInfo;
import java.util.List;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.model.SelectItem;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;

/**
 *
 * @author Jhonnatan Elias Medina Agudelo
 */
public class GestionController {

    public GestionController() {
        pagingInfo = new PagingInfo();
        converter = new GestionConverter();
    }
    private Gestion gestion = null;
    private List<Gestion> gestionItems = null;
    private GestionFacade jpaController = null;
    private GestionConverter converter = null;
    private PagingInfo pagingInfo = null;
    @Resource
    private UserTransaction utx = null;
    @PersistenceUnit(unitName = "AplicativoZComunicacionesPU")
    private EntityManagerFactory emf = null;

    public PagingInfo getPagingInfo() {
        if (pagingInfo.getItemCount() == -1) {
            pagingInfo.setItemCount(getJpaController().count());
        }
        return pagingInfo;
    }

    public GestionFacade getJpaController() {
        if (jpaController == null) {
            FacesContext facesContext = FacesContext.getCurrentInstance();
            jpaController = (GestionFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "gestionJpa");
        }
        return jpaController;
    }

    public SelectItem[] getGestionItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), false);
    }

    public SelectItem[] getGestionItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), true);
    }

    public Gestion getGestion() {
        if (gestion == null) {
            gestion = (Gestion) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentGestion", converter, null);
        }
        if (gestion == null) {
            gestion = new Gestion();
        }
        return gestion;
    }

    public String listSetup() {
        reset(true);
        return "gestion_list";
    }

    public String createSetup() {
        reset(false);
        gestion = new Gestion();
        return "gestion_create";
    }

    public String create() {
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().create(gestion);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Gestion was successfully created.");
            } else {
                JsfUtil.ensureAddErrorMessage(transactionException, "A persistence error occurred.");
            }
        } catch (Exception e) {
            try {
                utx.rollback();
            } catch (Exception ex) {
            }
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            return null;
        }
        return listSetup();
    }

    public String detailSetup() {
        return scalarSetup("gestion_detail");
    }

    public String editSetup() {
        return scalarSetup("gestion_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        gestion = (Gestion) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentGestion", converter, null);
        if (gestion == null) {
            String requestGestionString = JsfUtil.getRequestParameter("jsfcrud.currentGestion");
            JsfUtil.addErrorMessage("The gestion with id " + requestGestionString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String gestionString = converter.getAsString(FacesContext.getCurrentInstance(), null, gestion);
        String currentGestionString = JsfUtil.getRequestParameter("jsfcrud.currentGestion");
        if (gestionString == null || gestionString.length() == 0 || !gestionString.equals(currentGestionString)) {
            String outcome = editSetup();
            if ("gestion_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit gestion. Try again.");
            }
            return outcome;
        }
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().edit(gestion);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Gestion was successfully updated.");
            } else {
                JsfUtil.ensureAddErrorMessage(transactionException, "A persistence error occurred.");
            }
        } catch (Exception e) {
            try {
                utx.rollback();
            } catch (Exception ex) {
            }
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            return null;
        }
        return detailSetup();
    }

    public String remove() {
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentGestion");
        Integer id = new Integer(idAsString);
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().remove(getJpaController().find(id));
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Gestion was successfully deleted.");
            } else {
                JsfUtil.ensureAddErrorMessage(transactionException, "A persistence error occurred.");
            }
        } catch (Exception e) {
            try {
                utx.rollback();
            } catch (Exception ex) {
            }
            JsfUtil.ensureAddErrorMessage(e, "A persistence error occurred.");
            return null;
        }
        return relatedOrListOutcome();
    }

    private String relatedOrListOutcome() {
        String relatedControllerOutcome = relatedControllerOutcome();
        if (relatedControllerOutcome != null) {
            return relatedControllerOutcome;
        }
        return listSetup();
    }

    public List<Gestion> getGestionItems() {
        if (gestionItems == null) {
            getPagingInfo();
            gestionItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
        }
        return gestionItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "gestion_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "gestion_list";
    }

    private String relatedControllerOutcome() {
        String relatedControllerString = JsfUtil.getRequestParameter("jsfcrud.relatedController");
        String relatedControllerTypeString = JsfUtil.getRequestParameter("jsfcrud.relatedControllerType");
        if (relatedControllerString != null && relatedControllerTypeString != null) {
            FacesContext context = FacesContext.getCurrentInstance();
            Object relatedController = context.getApplication().getELResolver().getValue(context.getELContext(), null, relatedControllerString);
            try {
                Class<?> relatedControllerType = Class.forName(relatedControllerTypeString);
                Method detailSetupMethod = relatedControllerType.getMethod("detailSetup");
                return (String) detailSetupMethod.invoke(relatedController);
            } catch (ClassNotFoundException e) {
                throw new FacesException(e);
            } catch (NoSuchMethodException e) {
                throw new FacesException(e);
            } catch (IllegalAccessException e) {
                throw new FacesException(e);
            } catch (InvocationTargetException e) {
                throw new FacesException(e);
            }
        }
        return null;
    }

    private void reset(boolean resetFirstItem) {
        gestion = null;
        gestionItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        Gestion newGestion = new Gestion();
        String newGestionString = converter.getAsString(FacesContext.getCurrentInstance(), null, newGestion);
        String gestionString = converter.getAsString(FacesContext.getCurrentInstance(), null, gestion);
        if (!newGestionString.equals(gestionString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }
    
}
