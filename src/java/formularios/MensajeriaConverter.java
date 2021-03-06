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
public class MensajeriaConverter implements Converter {

    public Object getAsObject(FacesContext facesContext, UIComponent component, String string) {
        if (string == null || string.length() == 0) {
            return null;
        }
        Integer id = new Integer(string);
        MensajeriaController controller = (MensajeriaController) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "mensajeria");
        return controller.getJpaController().find(id);
    }

    public String getAsString(FacesContext facesContext, UIComponent component, Object object) {
        if (object == null) {
            return null;
        }
        if (object instanceof Mensajeria) {
            Mensajeria o = (Mensajeria) object;
            return o.getIdMensajeria() == null ? "" : o.getIdMensajeria().toString();
        } else {
            throw new IllegalArgumentException("object " + object + " is of type " + object.getClass().getName() + "; expected type: formularios.Mensajeria");
        }
    }
    
}
