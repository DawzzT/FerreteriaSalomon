using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Runtime.InteropServices;
using Ferreteria_Salomon.Presentaciones.Forms;

namespace Ferreteria_Salomon.Presentaciones
{
    public partial class NMenu : Form
    {
        string user, pass;
        public NMenu(string user, string pass)
        {
            this.user = user;
            this.pass = pass;   
            InitializeComponent();
        }

        //Mover formulario
        [DllImport("user32.DLL", EntryPoint = "ReleaseCapture")]
        private extern static void ReleaseCapture();
        [DllImport("user32.DLL", EntryPoint = "SendMessage")]
        private extern static void SendMessage(System.IntPtr hWnd, int Msg, int wParam, int lParam);


        private void pictMenu_Click(object sender, EventArgs e)
        {
            if (pnlNMenuVertical.Width == 180)
            {
                pnlNMenuVertical.Width = 55;
            }
            else
                pnlNMenuVertical.Width = 180;
        }

        private void pictNCerrarMenu_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void pictNMinimizarMenu_Click(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Minimized;
        }

        private void pnlNBarraTitulo_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0x112, 0xf012, 0);
        }

        private void pnlNMenuVertical_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0x112, 0xf012, 0);
        }

        private void pnlNContenedor_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0x112, 0xf012, 0);
        }

        private void AbrirProductos(object Products)
        {
            if (this.pnlNContenedor.Controls.Count > 0)
            
                this.pnlNContenedor.Controls.RemoveAt(0);
                Form Fproducts = Products as Form;
                Fproducts.TopLevel = false;
                Fproducts.Dock = DockStyle.Fill;
                this.pnlNContenedor.Controls.Add(Fproducts);
                this.pnlNContenedor.Tag = Fproducts;
                Fproducts.Show();
        }

        private void btnProductos_Click(object sender, EventArgs e)
        {
            AbrirProductos(new Productos());
        }

        private void AbrirClientes(object Clients)
        {
            if (this.pnlNContenedor.Controls.Count > 0)

                this.pnlNContenedor.Controls.RemoveAt(0);
            Form FClients = Clients as Form;
            FClients.TopLevel = false;
            FClients.Dock = DockStyle.Fill;
            this.pnlNContenedor.Controls.Add(FClients);
            this.pnlNContenedor.Tag = FClients;
            FClients.Show();
        }

        private void btnClientes_Click(object sender, EventArgs e)
        {
            AbrirClientes(new Clientes(user,pass));
        }

        private void AbrirVentas(object Vents)
        {
            if (this.pnlNContenedor.Controls.Count > 0)

                this.pnlNContenedor.Controls.RemoveAt(0);
            Form FVents = Vents as Form;
            FVents.TopLevel = false;
            FVents.Dock = DockStyle.Fill;
            this.pnlNContenedor.Controls.Add(FVents);
            this.pnlNContenedor.Tag = FVents;
            FVents.Show();
        }

        private void btnVentas_Click(object sender, EventArgs e)
        {
            AbrirVentas(new Ventas());
        }

        private void AbrirCompras(object Comprs)
        {
            if (this.pnlNContenedor.Controls.Count > 0)

                this.pnlNContenedor.Controls.RemoveAt(0);
            Form FComprs = Comprs as Form;
            FComprs.TopLevel = false;
            FComprs.Dock = DockStyle.Fill;
            this.pnlNContenedor.Controls.Add(FComprs);
            this.pnlNContenedor.Tag = FComprs;
            FComprs.Show();
        }

        private void btnCompras_Click(object sender, EventArgs e)
        {
            AbrirCompras(new Compras());
        }

        private void AbrirColaboradores(object Colaboradors)
        {
            if (this.pnlNContenedor.Controls.Count > 0)

                this.pnlNContenedor.Controls.RemoveAt(0);
            Form FColaboradors = Colaboradors as Form;
            FColaboradors.TopLevel = false;
            FColaboradors.Dock = DockStyle.Fill;
            this.pnlNContenedor.Controls.Add(FColaboradors);
            this.pnlNContenedor.Tag = FColaboradors;
            FColaboradors.Show();
        }
        private void btnColaboradores_Click(object sender, EventArgs e)
        {
            AbrirColaboradores(new Colaboradores());
        }

        private void pnlNMenuVertical_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
