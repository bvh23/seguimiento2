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
public class MensajeriaController {

    public MensajeriaController() {
        pagingInfo = new PagingInfo();
        converter = new MensajeriaConverter();
    }
    private Mensajeria mensajeria = null;
    private List<Mensajeria> mensajeriaItems = null;
    private MensajeriaFacade jpaController = null;
    private MensajeriaConverter converter = null;
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

    public MensajeriaFacade getJpaController() {
        if (jpaController == null) {
            FacesContext facesContext = FacesContext.getCurrentInstance();
            jpaController = (MensajeriaFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "mensajeriaJpa");
        }
        return jpaController;
    }

    public SelectItem[] getMensajeriaItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), false);
    }

    public SelectItem[] getMensajeriaItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), true);
    }

    public Mensajeria getMensajeria() {
        if (mensajeria == null) {
            mensajeria = (Mensajeria) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentMensajeria", converter, null);
        }
        if (mensajeria == null) {
            mensajeria = new Mensajeria();
        }
        return mensajeria;
    }

    public String listSetup() {
        reset(true);
        return "mensajeria_list";
    }

    public String createSetup() {
        reset(false);
        mensajeria = new Mensajeria();
        return "mensajeria_create";
    }

    public String create() {
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().create(mensajeria);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Mensajeria was successfully created.");
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
        return scalarSetup("mensajeria_detail");
    }

    public String editSetup() {
        return scalarSetup("mensajeria_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        mensajeria = (Mensajeria) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentMensajeria", converter, null);
        if (mensajeria == null) {
            String requestMensajeriaString = JsfUtil.getRequestParameter("jsfcrud.currentMensajeria");
            JsfUtil.addErrorMessage("The mensajeria with id " + requestMensajeriaString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String mensajeriaString = converter.getAsString(FacesContext.getCurrentInstance(), null, mensajeria);
        String currentMensajeriaString = JsfUtil.getRequestParameter("jsfcrud.currentMensajeria");
        if (mensajeriaString == null || mensajeriaString.length() == 0 || !mensajeriaString.equals(currentMensajeriaString)) {
            String outcome = editSetup();
            if ("mensajeria_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit mensajeria. Try again.");
            }
            return outcome;
        }
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().edit(mensajeria);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Mensajeria was successfully updated.");
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
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentMensajeria");
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
                JsfUtil.addSuccessMessage("Mensajeria was successfully deleted.");
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

    public List<Mensajeria> getMensajeriaItems() {
        if (mensajeriaItems == null) {
            getPagingInfo();
            mensajeriaItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
        }
        return mensajeriaItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "mensajeria_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "mensajeria_list";
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
        mensajeria = null;
        mensajeriaItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        Mensajeria newMensajeria = new Mensajeria();
        String newMensajeriaString = converter.getAsString(FacesContext.getCurrentInstance(), null, newMensajeria);
        String mensajeriaString = converter.getAsString(FacesContext.getCurrentInstance(), null, mensajeria);
        if (!newMensajeriaString.equals(mensajeriaString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }
    
}
