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
public class AlquilerConverter implements Converter {

    public Object getAsObject(FacesContext facesContext, UIComponent component, String string) {
        if (string == null || string.length() == 0) {
            return null;
        }
        Integer id = new Integer(string);
        AlquilerController controller = (AlquilerController) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "alquiler");
        return controller.getJpaController().find(id);
    }

    public String getAsString(FacesContext facesContext, UIComponent component, Object object) {
        if (object == null) {
            return null;
        }
        if (object instanceof Alquiler) {
            Alquiler o = (Alquiler) object;
            return o.getIdAlquiler() == null ? "" : o.getIdAlquiler().toString();
        } else {
            throw new IllegalArgumentException("object " + object + " is of type " + object.getClass().getName() + "; expected type: formularios.Alquiler");
        }
    }
    
}
