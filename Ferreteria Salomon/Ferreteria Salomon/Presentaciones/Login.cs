
using AltoControls;
using Ferreteria_Salomon.Presentaciones;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Security.Cryptography;
using System.Runtime.InteropServices;

namespace Ferreteria_Salomon
{
    public partial class Login : Form
    {
        public string user { get; set; }
        public string pass { get; set; }
        int cont = 3;

        Datos.Conectar con;
        BackgroundWorker bg = new BackgroundWorker();
        public Login()
        {
            InitializeComponent();
        }

        //Mover formulario
        [DllImport("user32.DLL", EntryPoint = "ReleaseCapture")]
        private extern static void ReleaseCapture();
        [DllImport("user32.DLL", EntryPoint = "SendMessage")]
        private extern static void SendMessage(System.IntPtr hWnd, int Msg, int wParam, int lParam);



        private void Form1_Load(object sender, EventArgs e)
        {
            txtContrase?a.Visible = true;
            txtUsuario.Visible = true;
            label1.Visible = true;
            btnAcceder.Visible = true;
            circularpb1.Visible = true;
            label2.Visible = false;
        }

        //Dise?o//
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
                txtUsuario.ForeColor = Color.Black;
            }
        }

        private void txtUsuario_Leave(object sender, EventArgs e)
        {
            if(txtUsuario.Text == "")
            {
                txtUsuario.Text = "Usuario";
                txtUsuario.ForeColor = Color.Black;
            }
        }

        private void txtContrase?a_Enter(object sender, EventArgs e)
        {
            if (txtContrase?a.Text == "Contrase?a")
            {
                txtContrase?a.Text = String.Empty;
                txtContrase?a.ForeColor = Color.Black;
                txtContrase?a.UseSystemPasswordChar = true;
            }
        }

        private void txtContrase?a_Leave(object sender, EventArgs e)
        {
            if (txtContrase?a.Text == "")
            {
                txtContrase?a.Text = "Contrase?a";
                txtContrase?a.ForeColor = Color.Black;
                txtContrase?a.UseSystemPasswordChar = false;
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

            txtContrase?a.Visible = false;
            txtUsuario.Visible = false;
            label1.Visible = false;
            btnAcceder.Visible = false;
            circularpb1.Visible = false;
            label2.Visible = true;

            this.Hide();

            //Abrir Menu
            NMenu NM = new NMenu(user,pass);
            NM.Show();
        }


        private void btnAcceder_Click(object sender, EventArgs e)
        {
          
            if (txtUsuario.Text.Equals(string.Empty) || txtContrase?a.Text.Equals(string.Empty) || txtContrase?a.Text.Equals("Contrase?a") || txtUsuario.Text.Equals("Usuario"))
            {
                MessageBox.Show("No pueden haber campos vacios", "Alerta");
              
                return;
            }

            con = new Datos.Conectar(txtUsuario.Text, txtContrase?a.Text);
            if (this.con.connect.State == ConnectionState.Open)
            {

                bg.WorkerReportsProgress = true;
                bg.ProgressChanged += bg_ProgressChanged;
                bg.DoWork += bg_DoWork;
                bg.RunWorkerCompleted += bg_RunWorkerCompleted;
                bg.RunWorkerAsync();
                user = txtUsuario.Text;
                pass = txtContrase?a.Text;
                circularpb1.Visible = true;
                this.con.connect.Close();
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


        private void panel1_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0x112, 0xf012, 0);
        }

        private void Login_MouseDown(object sender, MouseEventArgs e)
        {
            ReleaseCapture();
            SendMessage(this.Handle, 0x112, 0xf012, 0);
        }
    }
}
