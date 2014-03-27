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
public class ProcesoController {

    public ProcesoController() {
        pagingInfo = new PagingInfo();
        converter = new ProcesoConverter();
    }
    private Proceso proceso = null;
    private List<Proceso> procesoItems = null;
    private ProcesoFacade jpaController = null;
    private ProcesoConverter converter = null;
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

    public ProcesoFacade getJpaController() {
        if (jpaController == null) {
            FacesContext facesContext = FacesContext.getCurrentInstance();
            jpaController = (ProcesoFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "procesoJpa");
        }
        return jpaController;
    }

    public SelectItem[] getProcesoItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), false);
    }

    public SelectItem[] getProcesoItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), true);
    }

    public Proceso getProceso() {
        if (proceso == null) {
            proceso = (Proceso) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentProceso", converter, null);
        }
        if (proceso == null) {
            proceso = new Proceso();
        }
        return proceso;
    }

    public String listSetup() {
        reset(true);
        return "proceso_list";
    }

    public String createSetup() {
        reset(false);
        proceso = new Proceso();
        return "proceso_create";
    }

    public String create() {
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().create(proceso);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Proceso was successfully created.");
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
        return scalarSetup("proceso_detail");
    }

    public String editSetup() {
        return scalarSetup("proceso_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        proceso = (Proceso) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentProceso", converter, null);
        if (proceso == null) {
            String requestProcesoString = JsfUtil.getRequestParameter("jsfcrud.currentProceso");
            JsfUtil.addErrorMessage("The proceso with id " + requestProcesoString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String procesoString = converter.getAsString(FacesContext.getCurrentInstance(), null, proceso);
        String currentProcesoString = JsfUtil.getRequestParameter("jsfcrud.currentProceso");
        if (procesoString == null || procesoString.length() == 0 || !procesoString.equals(currentProcesoString)) {
            String outcome = editSetup();
            if ("proceso_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit proceso. Try again.");
            }
            return outcome;
        }
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().edit(proceso);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Proceso was successfully updated.");
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
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentProceso");
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
                JsfUtil.addSuccessMessage("Proceso was successfully deleted.");
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

    public List<Proceso> getProcesoItems() {
        if (procesoItems == null) {
            getPagingInfo();
            procesoItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
        }
        return procesoItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "proceso_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "proceso_list";
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
        proceso = null;
        procesoItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        Proceso newProceso = new Proceso();
        String newProcesoString = converter.getAsString(FacesContext.getCurrentInstance(), null, newProceso);
        String procesoString = converter.getAsString(FacesContext.getCurrentInstance(), null, proceso);
        if (!newProcesoString.equals(procesoString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }
    
}
