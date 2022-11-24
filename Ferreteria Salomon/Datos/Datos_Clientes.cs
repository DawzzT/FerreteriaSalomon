using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;

namespace Datos
{
    public class Datos_Clientes
    {
       
        string cadena = "Server=DESKTOP-7JOJTLI;Database=FerreteriaSalomon;UID=";
        public DataTable Listar(string user , string pass)
        {
            SqlDataReader resultado;
            DataTable table = new DataTable();
            SqlConnection conexion = new SqlConnection();
            try
            {
                conexion =new SqlConnection(cadena + user + ";PWD=" + pass);
                SqlCommand cmd = new SqlCommand("ListarClientes", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                conexion.Open();
                resultado = cmd.ExecuteReader();
                table.Load(resultado);
                return table;
               
            }
            catch(Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (conexion.State == ConnectionState.Open) conexion.Close();
            }
           
            
            
        }

        public DataTable Buscar(int id, string user, string pass)
        {
            SqlDataReader resultado;
            DataTable table = new DataTable();
            SqlConnection conexion = new SqlConnection();

            try
            {
                conexion = new SqlConnection(cadena + user + ";PWD=" + pass);
                SqlCommand cmd = new SqlCommand("BuscarCliente", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@IDC", SqlDbType.Int).Value = id;
                conexion.Open();
                resultado = cmd.ExecuteReader();
                table.Load(resultado);
                return table;

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (conexion.State == ConnectionState.Open) conexion.Close();
            }
        }


        public string Insertar(Clientes clientes, string user, string pass)
        {
            String respuesta = "";
            SqlConnection conexion = new SqlConnection();

            try
            {
                conexion = new SqlConnection(cadena + user + ";PWD=" + pass);
                SqlCommand cmd = new SqlCommand("NCliente", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@PNC", SqlDbType.NVarChar).Value = clientes.PNC;
                cmd.Parameters.Add("@SNC", SqlDbType.NVarChar).Value = clientes.SNC;
                cmd.Parameters.Add("@PAC", SqlDbType.NVarChar).Value = clientes.PAC;
                cmd.Parameters.Add("@SAC", SqlDbType.NVarChar).Value = clientes.SAC;
                cmd.Parameters.Add("@IDM", SqlDbType.Int).Value = clientes.Id_Mun;
                cmd.Parameters.Add("@DC", SqlDbType.NVarChar).Value = clientes.Dirc;
                cmd.Parameters.Add("@TC", SqlDbType.Char).Value = clientes.TelC;
                cmd.Parameters.Add("@EC", SqlDbType.NVarChar).Value = clientes.Email;
                conexion.Open();
                respuesta = cmd.ExecuteNonQuery() == 1 ? "OK" : "No se pudo insertar";

            }
            catch (Exception ex)
            {
                respuesta = ex.Message;
            }
            finally
            {
                if (conexion.State == ConnectionState.Open) conexion.Close();
            }
            return respuesta;
        }

        public string Actualizar(Clientes clientes, string user, string pass)
        {
            String respuesta = "";
            SqlConnection conexion = new SqlConnection();

            try
            {
                conexion = new SqlConnection(cadena + user + ";PWD=" + pass);
                SqlCommand cmd = new SqlCommand("ActCliente", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@IDC", SqlDbType.Int).Value = clientes.Id_Cliente;
                cmd.Parameters.Add("@IDM", SqlDbType.Int).Value = clientes.Id_Mun;
                cmd.Parameters.Add("@DC", SqlDbType.NVarChar).Value = clientes.Dirc;
                cmd.Parameters.Add("@TC", SqlDbType.Char).Value = clientes.TelC;
                cmd.Parameters.Add("@Emailc", SqlDbType.NVarChar).Value = clientes.Email;
                conexion.Open();
                respuesta = cmd.ExecuteNonQuery() == 1 ? "OK" : "No se pudo actualizar";

            }
            catch (Exception ex)
            {
                respuesta = ex.Message;
            }
            finally
            {
                if (conexion.State == ConnectionState.Open) conexion.Close();
            }
            return respuesta;
        }

        public string Eliminar(int id, string user, string pass)
        {
            String respuesta = "";
            SqlConnection conexion = new SqlConnection();

            try
            {
                conexion = new SqlConnection(cadena + user + ";PWD=" + pass);
                SqlCommand cmd = new SqlCommand("BCliente", conexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@IDC", SqlDbType.Int).Value = id;
                conexion.Open();
                respuesta = cmd.ExecuteNonQuery() == 1 ? "OK" : "No se pudo eliminar";

            }
            catch (Exception ex)
            {
                respuesta = ex.Message;
            }
            finally
            {
                if (conexion.State == ConnectionState.Open) conexion.Close();
            }
            return respuesta;
        }
    }
}
