<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

 
 
 <% 
    
 try{
 	 String s[]=null;
		 
        String str2=(String)request.getParameter("q");
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver"); 
        Connection con =DriverManager.getConnection("jdbc:odbc:ZComunicaciones");
        Statement st=con.createStatement(); 
        ResultSet rs = st.executeQuery("Select cl.NombreCliente,cl.Codigo from Clientes cl WHERE NombreCliente LIKE '%"+str2+"%' ");
                
       List li = new ArrayList();
 
       while(rs.next())
       {
           li.add(rs.getString(1)+"\n"+rs.getInt(2)+"\n");
            
       }
 
       String[] str = new String[li.size()];
       Iterator it = li.iterator();
 
       int i = 0;
       while(it.hasNext())
       {
           String p = (String)it.next();
           str[i] = p;
           i++;
       }
 
    //jQuery related start
       String query = (String)request.getParameter("q");
 
       int cnt=1;
       for(int j=0;j<str.length;j++)
       {
           if(str[j].toUpperCase().startsWith(query.toUpperCase()))
           {
              out.print(str[j]+"\n");
              if(cnt>=400)
              break;
              cnt++;
            }
       }
    //jQuery related end
 
rs.close();
st.close();
con.close();
 
}
catch(Exception e){
e.printStackTrace();
}

        
 %>

 
 