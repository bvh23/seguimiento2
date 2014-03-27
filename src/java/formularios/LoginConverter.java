/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package formularios;

import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;

/**
 *
 * @author Jhonnatan Elias Medina Agudelo
 */
public class LoginConverter implements Converter {

    public Object getAsObject(FacesContext facesContext, UIComponent component, String string) {
        if (string == null || string.length() == 0) {
            return null;
        }
        String id = string;
        LoginController controller = (LoginController) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "login");
        return controller.getJpaController().find(id);
    }

    public String getAsString(FacesContext facesContext, UIComponent component, Object object) {
        if (object == null) {
            return null;
        }
        if (object instanceof Login) {
            Login o = (Login) object;
            return o.getUsuario() == null ? "" : o.getUsuario().toString();
        } else {
            throw new IllegalArgumentException("object " + object + " is of type " + object.getClass().getName() + "; expected type: formularios.Login");
        }
    }
    
}
