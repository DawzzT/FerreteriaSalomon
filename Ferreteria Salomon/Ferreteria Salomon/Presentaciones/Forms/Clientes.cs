using Negocio;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Ferreteria_Salomon.Presentaciones.Forms
{
    public partial class Clientes : Form
    {
       
        Login log = new Login();
        string user, pass;
        public Clientes(string user, string pass)
        {
            this.pass= pass;    
            this.user= user;    
            InitializeComponent();
        }

        private void dataGridViewClientes_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void Clientes_Load(object sender, EventArgs e)
        {
            dataGridViewClientes.DataSource = Negocio_Cliente.Listar(user, pass);
        }
    }
}
