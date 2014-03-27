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
public class AlquilerController {

    public AlquilerController() {
        pagingInfo = new PagingInfo();
        converter = new AlquilerConverter();
    }
    private Alquiler alquiler = null;
    private List<Alquiler> alquilerItems = null;
    private AlquilerFacade jpaController = null;
    private AlquilerConverter converter = null;
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

    public AlquilerFacade getJpaController() {
        if (jpaController == null) {
            FacesContext facesContext = FacesContext.getCurrentInstance();
            jpaController = (AlquilerFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "alquilerJpa");
        }
        return jpaController;
    }

    public SelectItem[] getAlquilerItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), false);
    }

    public SelectItem[] getAlquilerItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), true);
    }

    public Alquiler getAlquiler() {
        if (alquiler == null) {
            alquiler = (Alquiler) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentAlquiler", converter, null);
        }
        if (alquiler == null) {
            alquiler = new Alquiler();
        }
        return alquiler;
    }

    public String listSetup() {
        reset(true);
        return "alquiler_list";
    }

    public String createSetup() {
        reset(false);
        alquiler = new Alquiler();
        return "alquiler_create";
    }

    public String create() {
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().create(alquiler);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Alquiler was successfully created.");
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
        return scalarSetup("alquiler_detail");
    }

    public String editSetup() {
        return scalarSetup("alquiler_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        alquiler = (Alquiler) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentAlquiler", converter, null);
        if (alquiler == null) {
            String requestAlquilerString = JsfUtil.getRequestParameter("jsfcrud.currentAlquiler");
            JsfUtil.addErrorMessage("The alquiler with id " + requestAlquilerString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String alquilerString = converter.getAsString(FacesContext.getCurrentInstance(), null, alquiler);
        String currentAlquilerString = JsfUtil.getRequestParameter("jsfcrud.currentAlquiler");
        if (alquilerString == null || alquilerString.length() == 0 || !alquilerString.equals(currentAlquilerString)) {
            String outcome = editSetup();
            if ("alquiler_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit alquiler. Try again.");
            }
            return outcome;
        }
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().edit(alquiler);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Alquiler was successfully updated.");
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
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentAlquiler");
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
                JsfUtil.addSuccessMessage("Alquiler was successfully deleted.");
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

    public List<Alquiler> getAlquilerItems() {
        if (alquilerItems == null) {
            getPagingInfo();
            alquilerItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
        }
        return alquilerItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "alquiler_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "alquiler_list";
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
        alquiler = null;
        alquilerItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        Alquiler newAlquiler = new Alquiler();
        String newAlquilerString = converter.getAsString(FacesContext.getCurrentInstance(), null, newAlquiler);
        String alquilerString = converter.getAsString(FacesContext.getCurrentInstance(), null, alquiler);
        if (!newAlquilerString.equals(alquilerString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }
    
}
