using System.Data.SqlClient;

namespace Datos
{
    public class Conectar
    {
        public SqlConnection connect = new SqlConnection();

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