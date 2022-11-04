using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ferreteria_Salomon
{
 
    
    internal class Conectar
    {
        public SqlConnection connect = new SqlConnection();

        public Conectar(String user, String pass)
        {
            try
            {

                connect = new SqlConnection("Server=DESKTOP-9UHN9KS;Database=FerreteriaSalomon;UID=" + user + ";PWD=" + pass);
                connect.Open();
            }
            catch (Exception)
            {


            }
        }
    }
}
