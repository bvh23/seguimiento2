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
public class ClientesController {

    public ClientesController() {
        pagingInfo = new PagingInfo();
        converter = new ClientesConverter();
    }
    private Clientes clientes = null;
    private List<Clientes> clientesItems = null;
    private ClientesFacade jpaController = null;
    private ClientesConverter converter = null;
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

    public ClientesFacade getJpaController() {
        if (jpaController == null) {
            FacesContext facesContext = FacesContext.getCurrentInstance();
            jpaController = (ClientesFacade) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "clientesJpa");
        }
        return jpaController;
    }

    public SelectItem[] getClientesItemsAvailableSelectMany() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), false);
    }

    public SelectItem[] getClientesItemsAvailableSelectOne() {
        return JsfUtil.getSelectItems(getJpaController().findAll(), true);
    }

    public Clientes getClientes() {
        if (clientes == null) {
            clientes = (Clientes) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentClientes", converter, null);
        }
        if (clientes == null) {
            clientes = new Clientes();
        }
        return clientes;
    }

    public String listSetup() {
        reset(true);
        return "clientes_list";
    }

    public String createSetup() {
        reset(false);
        clientes = new Clientes();
        return "clientes_create";
    }

    public String create() {
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().create(clientes);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Clientes was successfully created.");
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
        return scalarSetup("clientes_detail");
    }

    public String editSetup() {
        return scalarSetup("clientes_edit");
    }

    private String scalarSetup(String destination) {
        reset(false);
        clientes = (Clientes) JsfUtil.getObjectFromRequestParameter("jsfcrud.currentClientes", converter, null);
        if (clientes == null) {
            String requestClientesString = JsfUtil.getRequestParameter("jsfcrud.currentClientes");
            JsfUtil.addErrorMessage("The clientes with id " + requestClientesString + " no longer exists.");
            return relatedOrListOutcome();
        }
        return destination;
    }

    public String edit() {
        String clientesString = converter.getAsString(FacesContext.getCurrentInstance(), null, clientes);
        String currentClientesString = JsfUtil.getRequestParameter("jsfcrud.currentClientes");
        if (clientesString == null || clientesString.length() == 0 || !clientesString.equals(currentClientesString)) {
            String outcome = editSetup();
            if ("clientes_edit".equals(outcome)) {
                JsfUtil.addErrorMessage("No se puede editar el Clientes, Inténtelo de nuevo.");
            }
            return outcome;
        }
        try {
            utx.begin();
        } catch (Exception ex) {
        }
        try {
            Exception transactionException = null;
            getJpaController().edit(clientes);
            try {
                utx.commit();
            } catch (javax.transaction.RollbackException ex) {
                transactionException = ex;
            } catch (Exception ex) {
            }
            if (transactionException == null) {
                JsfUtil.addSuccessMessage("Clientes was successfully updated.");
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
        String idAsString = JsfUtil.getRequestParameter("jsfcrud.currentClientes");
        Long id = new Long(idAsString);
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
                JsfUtil.addSuccessMessage("Clientes was successfully deleted.");
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

    public List<Clientes> getClientesItems() {
        if (clientesItems == null) {
            getPagingInfo();
            clientesItems = getJpaController().findRange(new int[]{pagingInfo.getFirstItem(), pagingInfo.getFirstItem() + pagingInfo.getBatchSize()});
        }
        return clientesItems;
    }

    public String next() {
        reset(false);
        getPagingInfo().nextPage();
        return "clientes_list";
    }

    public String prev() {
        reset(false);
        getPagingInfo().previousPage();
        return "clientes_list";
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
        clientes = null;
        clientesItems = null;
        pagingInfo.setItemCount(-1);
        if (resetFirstItem) {
            pagingInfo.setFirstItem(0);
        }
    }

    public void validateCreate(FacesContext facesContext, UIComponent component, Object value) {
        Clientes newClientes = new Clientes();
        String newClientesString = converter.getAsString(FacesContext.getCurrentInstance(), null, newClientes);
        String clientesString = converter.getAsString(FacesContext.getCurrentInstance(), null, clientes);
        if (!newClientesString.equals(clientesString)) {
            createSetup();
        }
    }

    public Converter getConverter() {
        return converter;
    }
    
}
