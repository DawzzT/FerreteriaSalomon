
using AltoControls;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Security.Cryptography;

namespace Ferreteria_Salomon
{
    public partial class Login : Form
    {
        int cont = 3;

        Conectar con;
        BackgroundWorker bg = new BackgroundWorker();
        public Login()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            txtContraseña.Visible = true;
            txtUsuario.Visible = true;
            label1.Visible = true;
            btnAcceder.Visible = true;
            circularpb1.Visible = true;
            label2.Visible = false;
        }

        //Diseño//
        private void pictMinimizar_Click(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Minimized;
        }

        private void pictCerrar_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void txtUsuario_Enter(object sender, EventArgs e)
        {
            if(txtUsuario.Text == "Usuario")
            {
                txtUsuario.Text = String.Empty;
                txtUsuario.ForeColor = Color.LightGray;
            }
        }

        private void txtUsuario_Leave(object sender, EventArgs e)
        {
            if(txtUsuario.Text == "")
            {
                txtUsuario.Text = "Usuario";
                txtUsuario.ForeColor = Color.LightGray;
            }
        }

        private void txtContraseña_Enter(object sender, EventArgs e)
        {
            if (txtContraseña.Text == "Contraseña")
            {
                txtContraseña.Text = String.Empty;
                txtContraseña.ForeColor = Color.LightGray;
                txtContraseña.UseSystemPasswordChar = true;
            }
        }

        private void txtContraseña_Leave(object sender, EventArgs e)
        {
            if (txtContraseña.Text == "")
            {
                txtContraseña.Text = "Contraseña";
                txtContraseña.ForeColor = Color.LightGray;
                txtContraseña.UseSystemPasswordChar = false;
            }
        }


        //Login

        private void bg_DoWork(object sender, EventArgs e)
        {
            int progreso = 0;


            for (int i = 0; i <= 100; i++)
            {
                progreso++;
                Thread.Sleep(50);
                bg.ReportProgress(i);
            }
        }

        private void bg_ProgressChanged(object sender, ProgressChangedEventArgs e)
        {
            circularpb1.Value = e.ProgressPercentage;
           


            if (e.ProgressPercentage > 100)
            {
               
                circularpb1.Value = circularpb1.MaxValue;
            }
            else
            {
               
                circularpb1.Value = e.ProgressPercentage;
            }


        }

        private void bg_RunWorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
        {

            txtContraseña.Visible = false;
            txtUsuario.Visible = false;
            label1.Visible = false;
            btnAcceder.Visible = false;
            circularpb1.Visible = false;
            label2.Visible = true;

        }


        private void btnAcceder_Click(object sender, EventArgs e)
        {
          
            if (txtUsuario.Text.Equals(string.Empty) || txtContraseña.Text.Equals(string.Empty) || txtContraseña.Text.Equals("Contraseña") || txtUsuario.Text.Equals("Usuario"))
            {
                MessageBox.Show("No pueden haber campos vacios", "Alerta");
              
                return;
            }

            con = new Conectar(txtUsuario.Text, txtContraseña.Text);
            if (this.con.connect.State == ConnectionState.Open)
            {

                bg.WorkerReportsProgress = true;
                bg.ProgressChanged += bg_ProgressChanged;
                bg.DoWork += bg_DoWork;
                bg.RunWorkerCompleted += bg_RunWorkerCompleted;
                bg.RunWorkerAsync();
                
                circularpb1.Visible = true;

               
                   
               
            }
            else
            {
                
                --cont;
                MessageBox.Show("Error:usuario o contrasenia incorrecta ", cont + " Intentos restantes");
                if (cont == 0)
                {
                    MessageBox.Show("Demasiados intentos fallidos intentelo de nuevo en 30 segundos");
                    cont = 3;


                    btnAcceder.Enabled = false;
                    Thread.Sleep(10000); 
                    btnAcceder.Enabled = true;
                  

                }


            }

        }
    }
}
