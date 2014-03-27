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
public class LaboratorioController {

    public LaboratorioController() {
        pagingInfo = new PagingInfo();
        converter = new LaboratorioConverter();
    }
    private Laboratorio laboratorio = null;
    private List<Laboratorio> laboratorioItems = null;
    private LaboratorioFacade jpaController = null;
    private LaboratorioConverter converter = null;
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

    public LaboratorioFacade getJpaController() {
        if (jpaController == null) {
            FacesContext facesContext = FacesContext.getCurrentInstance();
            jpaController = (LaboratorioFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "laboratorioJpa");
        }
        return jpaController;
    }

    public SelectItem[] getLaboratorioItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), false);
    }

    public SelectItem[] getLaboratorioItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), true);
    }

    public Laboratorio getLaboratorio() {
        if (laboratorio == null) {
            laboratorio = (Laboratorio) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentLaboratorio", converter, null);
        }
        if (laboratorio == null) {
            laboratorio = new Laboratorio();
        }
        return laboratorio;
    }

    public String listSetup() {
        reset(true);
        return "laboratorio_list";
    }

    public String createSetup() {
        reset(false);
        laboratorio = new Laboratorio();
        return "laboratorio_create";
    }

    public String create() {
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().create(laboratorio);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Laboratorio was successfully created.");
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
        return scalarSetup("laboratorio_detail");
    }

    public String editSetup() {
        return scalarSetup("laboratorio_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        laboratorio = (Laboratorio) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentLaboratorio", converter, null);
        if (laboratorio == null) {
            String requestLaboratorioString = JsfUtil.getRequestParameter("jsfcrud.currentLaboratorio");
            JsfUtil.addErrorMessage("The laboratorio with id " + requestLaboratorioString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String laboratorioString = converter.getAsString(FacesContext.getCurrentInstance(), null, laboratorio);
        String currentLaboratorioString = JsfUtil.getRequestParameter("jsfcrud.currentLaboratorio");
        if (laboratorioString == null || laboratorioString.length() == 0 || !laboratorioString.equals(currentLaboratorioString)) {
            String outcome = editSetup();
            if ("laboratorio_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit laboratorio. Try again.");
            }
            return outcome;
        }
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().edit(laboratorio);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Laboratorio was successfully updated.");
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
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentLaboratorio");
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
                JsfUtil.addSuccessMessage("Laboratorio was successfully deleted.");
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

    public List<Laboratorio> getLaboratorioItems() {
        if (laboratorioItems == null) {
            getPagingInfo();
            laboratorioItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
        }
        return laboratorioItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "laboratorio_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "laboratorio_list";
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
        laboratorio = null;
        laboratorioItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        Laboratorio newLaboratorio = new Laboratorio();
        String newLaboratorioString = converter.getAsString(FacesContext.getCurrentInstance(), null, newLaboratorio);
        String laboratorioString = converter.getAsString(FacesContext.getCurrentInstance(), null, laboratorio);
        if (!newLaboratorioString.equals(laboratorioString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }
    
}
