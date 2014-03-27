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
 * @author z Jhonnatan Elias Medina Agudelo
 */
public class VentasController {

    public VentasController() {
        pagingInfo = new PagingInfo();
        converter = new VentasConverter();
    }
    private Ventas ventas = null;
    private List<Ventas> ventasItems = null;
    private VentasFacade jpaController = null;
    private VentasConverter converter = null;
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

    public VentasFacade getJpaController() {
        if (jpaController == null) {
            FacesContext facesContext = FacesContext.getCurrentInstance();
            jpaController = (VentasFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "ventasJpa");
        }
        return jpaController;
    }

    public SelectItem[] getVentasItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), false);
    }

    public SelectItem[] getVentasItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), true);
    }

    public Ventas getVentas() {
        if (ventas == null) {
            ventas = (Ventas) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentVentas", converter, null);
        }
        if (ventas == null) {
            ventas = new Ventas();
        }
        return ventas;
    }

    public String listSetup() {
        reset(true);
        return "ventas_list";
    }

    public String createSetup() {
        reset(false);
        ventas = new Ventas();
        return "ventas_create";
    }

    public String create() {
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().create(ventas);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Ventas was successfully created.");
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
        return scalarSetup("ventas_detail");
    }

    public String editSetup() {
        return scalarSetup("ventas_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        ventas = (Ventas) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentVentas", converter, null);
        if (ventas == null) {
            String requestVentasString = JsfUtil.getRequestParameter("jsfcrud.currentVentas");
            JsfUtil.addErrorMessage("The ventas with id " + requestVentasString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String ventasString = converter.getAsString(FacesContext.getCurrentInstance(), null, ventas);
        String currentVentasString = JsfUtil.getRequestParameter("jsfcrud.currentVentas");
        if (ventasString == null || ventasString.length() == 0 || !ventasString.equals(currentVentasString)) {
            String outcome = editSetup();
            if ("ventas_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("Could not edit ventas. Try again.");
            }
            return outcome;
        }
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().edit(ventas);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Ventas was successfully updated.");
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
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentVentas");
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
                JsfUtil.addSuccessMessage("Ventas was successfully deleted.");
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

    public List<Ventas> getVentasItems() {
        if (ventasItems == null) {
            getPagingInfo();
            ventasItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
        }
        return ventasItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "ventas_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "ventas_list";
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
        ventas = null;
        ventasItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        Ventas newVentas = new Ventas();
        String newVentasString = converter.getAsString(FacesContext.getCurrentInstance(), null, newVentas);
        String ventasString = converter.getAsString(FacesContext.getCurrentInstance(), null, ventas);
        if (!newVentasString.equals(ventasString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }
    
}
