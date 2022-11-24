using Datos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class Negocio_Cliente
    {
        public static DataTable Listar(string user, string pass)
        {
            Datos_Clientes datos = new Datos_Clientes();

            return datos.Listar(user, pass);        }

    }
}
