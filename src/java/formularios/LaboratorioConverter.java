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
public class LaboratorioConverter implements Converter {

    public Object getAsObject(FacesContext facesContext, UIComponent component, String string) {
        if (string == null || string.length() == 0) {
            return null;
        }
        Integer id = new Integer(string);
        LaboratorioController controller = (LaboratorioController) facesContext.getApplication().getELResolver().getValue(facesContext.getELContext(), null, "laboratorio");
        return controller.getJpaController().find(id);
    }

    public String getAsString(FacesContext facesContext, UIComponent component, Object object) {
        if (object == null) {
            return null;
        }
        if (object instanceof Laboratorio) {
            Laboratorio o = (Laboratorio) object;
            return o.getIdLaboratorio() == null ? "" : o.getIdLaboratorio().toString();
        } else {
            throw new IllegalArgumentException("object " + object + " is of type " + object.getClass().getName() + "; expected type: formularios.Laboratorio");
        }
    }
    
}
