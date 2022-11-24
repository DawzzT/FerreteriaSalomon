using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Metadata;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class Conectar
    {
        public SqlConnection connect = new SqlConnection();
        public string conexion;
        public Conectar(String user, String pass)
        {
            try
            {

                connect = new SqlConnection("Server=DESKTOP-7JOJTLI;Database=FerreteriaSalomon;UID=" + user + ";PWD=" + pass);
                connect.Open();
                
            }
            catch (Exception)
            {


            }
            
        }
    }
}