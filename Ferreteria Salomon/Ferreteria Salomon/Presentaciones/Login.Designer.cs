namespace Ferreteria_Salomon
{
    partial class Login
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Login));
            this.panelLogo = new System.Windows.Forms.Panel();
            this.txtUsuario = new System.Windows.Forms.TextBox();
            this.txtContraseña = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.btnAcceder = new System.Windows.Forms.Button();
            this.pictCerrarLogin = new System.Windows.Forms.PictureBox();
            this.pictMinimizarLogin = new System.Windows.Forms.PictureBox();
            this.circularpb1 = new AltoControls.CircularPB();
            this.timer1 = new System.Windows.Forms.Timer(this.components);
            this.label2 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.pictCerrarLogin)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictMinimizarLogin)).BeginInit();
            this.SuspendLayout();
            // 
            // panelLogo
            // 
            this.panelLogo.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("panelLogo.BackgroundImage")));
            this.panelLogo.Dock = System.Windows.Forms.DockStyle.Left;
            this.panelLogo.Location = new System.Drawing.Point(0, 0);
            this.panelLogo.Name = "panelLogo";
            this.panelLogo.Size = new System.Drawing.Size(350, 440);
            this.panelLogo.TabIndex = 0;
            this.panelLogo.MouseDown += new System.Windows.Forms.MouseEventHandler(this.panel1_MouseDown);
            // 
            // txtUsuario
            // 
            this.txtUsuario.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(157)))), ((int)(((byte)(146)))), ((int)(((byte)(167)))));
            this.txtUsuario.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.txtUsuario.Cursor = System.Windows.Forms.Cursors.Hand;
            this.txtUsuario.Font = new System.Drawing.Font("Century Gothic", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.txtUsuario.ForeColor = System.Drawing.Color.Black;
            this.txtUsuario.Location = new System.Drawing.Point(376, 87);
            this.txtUsuario.Name = "txtUsuario";
            this.txtUsuario.Size = new System.Drawing.Size(653, 25);
            this.txtUsuario.TabIndex = 1;
            this.txtUsuario.Text = "Usuario";
            this.txtUsuario.Enter += new System.EventHandler(this.txtUsuario_Enter);
            this.txtUsuario.Leave += new System.EventHandler(this.txtUsuario_Leave);
            // 
            // txtContraseña
            // 
            this.txtContraseña.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(157)))), ((int)(((byte)(146)))), ((int)(((byte)(167)))));
            this.txtContraseña.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.txtContraseña.Cursor = System.Windows.Forms.Cursors.Hand;
            this.txtContraseña.Font = new System.Drawing.Font("Century Gothic", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.txtContraseña.ForeColor = System.Drawing.Color.Black;
            this.txtContraseña.Location = new System.Drawing.Point(376, 207);
            this.txtContraseña.Name = "txtContraseña";
            this.txtContraseña.Size = new System.Drawing.Size(653, 25);
            this.txtContraseña.TabIndex = 2;
            this.txtContraseña.Text = "Contraseña";
            this.txtContraseña.Enter += new System.EventHandler(this.txtContraseña_Enter);
            this.txtContraseña.Leave += new System.EventHandler(this.txtContraseña_Leave);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Century Gothic", 20.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.label1.ForeColor = System.Drawing.Color.Black;
            this.label1.Location = new System.Drawing.Point(647, 12);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(126, 40);
            this.label1.TabIndex = 4;
            this.label1.Text = "LOGIN";
            // 
            // btnAcceder
            // 
            this.btnAcceder.BackColor = System.Drawing.Color.DimGray;
            this.btnAcceder.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnAcceder.FlatAppearance.BorderSize = 0;
            this.btnAcceder.FlatAppearance.MouseDownBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(28)))), ((int)(((byte)(28)))), ((int)(((byte)(28)))));
            this.btnAcceder.FlatAppearance.MouseOverBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(64)))), ((int)(((byte)(64)))));
            this.btnAcceder.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnAcceder.ForeColor = System.Drawing.Color.LightGray;
            this.btnAcceder.Location = new System.Drawing.Point(455, 277);
            this.btnAcceder.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.btnAcceder.Name = "btnAcceder";
            this.btnAcceder.Size = new System.Drawing.Size(503, 40);
            this.btnAcceder.TabIndex = 3;
            this.btnAcceder.Text = "ACCEDER";
            this.btnAcceder.UseVisualStyleBackColor = false;
            this.btnAcceder.Click += new System.EventHandler(this.btnAcceder_Click);
            // 
            // pictCerrarLogin
            // 
            this.pictCerrarLogin.Cursor = System.Windows.Forms.Cursors.Hand;
            this.pictCerrarLogin.Image = global::Ferreteria_Salomon.Properties.Resources.icons8_cancel_20;
            this.pictCerrarLogin.Location = new System.Drawing.Point(1003, 0);
            this.pictCerrarLogin.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.pictCerrarLogin.Name = "pictCerrarLogin";
            this.pictCerrarLogin.Size = new System.Drawing.Size(20, 20);
            this.pictCerrarLogin.SizeMode = System.Windows.Forms.PictureBoxSizeMode.AutoSize;
            this.pictCerrarLogin.TabIndex = 6;
            this.pictCerrarLogin.TabStop = false;
            this.pictCerrarLogin.Click += new System.EventHandler(this.pictCerrar_Click);
            // 
            // pictMinimizarLogin
            // 
            this.pictMinimizarLogin.Cursor = System.Windows.Forms.Cursors.Hand;
            this.pictMinimizarLogin.Image = ((System.Drawing.Image)(resources.GetObject("pictMinimizarLogin.Image")));
            this.pictMinimizarLogin.Location = new System.Drawing.Point(959, 0);
            this.pictMinimizarLogin.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.pictMinimizarLogin.Name = "pictMinimizarLogin";
            this.pictMinimizarLogin.Size = new System.Drawing.Size(20, 20);
            this.pictMinimizarLogin.SizeMode = System.Windows.Forms.PictureBoxSizeMode.AutoSize;
            this.pictMinimizarLogin.TabIndex = 7;
            this.pictMinimizarLogin.TabStop = false;
            this.pictMinimizarLogin.Click += new System.EventHandler(this.pictMinimizar_Click);
            // 
            // circularpb1
            // 
            this.circularpb1.AllowText = true;
            this.circularpb1.AutomaticFontCalculation = true;
            this.circularpb1.BackColor = System.Drawing.Color.Transparent;
            this.circularpb1.ForeColor = System.Drawing.Color.SlateGray;
            this.circularpb1.Location = new System.Drawing.Point(672, 325);
            this.circularpb1.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.circularpb1.MaxValue = 100;
            this.circularpb1.MinimumSize = new System.Drawing.Size(69, 80);
            this.circularpb1.MinValue = 0;
            this.circularpb1.Name = "circularpb1";
            this.circularpb1.ProgressColor = System.Drawing.Color.DarkBlue;
            this.circularpb1.Size = new System.Drawing.Size(69, 80);
            this.circularpb1.Stroke = 10;
            this.circularpb1.TabIndex = 8;
            this.circularpb1.Text = "circularpb1";
            this.circularpb1.Transparency = true;
            this.circularpb1.Value = 0;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Century Gothic", 20.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.label2.ForeColor = System.Drawing.Color.Black;
            this.label2.Location = new System.Drawing.Point(601, 129);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(217, 40);
            this.label2.TabIndex = 9;
            this.label2.Text = "BIENVENIDO";
            // 
            // Login
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(65)))), ((int)(((byte)(101)))), ((int)(((byte)(141)))));
            this.ClientSize = new System.Drawing.Size(1040, 440);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.circularpb1);
            this.Controls.Add(this.pictMinimizarLogin);
            this.Controls.Add(this.pictCerrarLogin);
            this.Controls.Add(this.btnAcceder);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txtContraseña);
            this.Controls.Add(this.txtUsuario);
            this.Controls.Add(this.panelLogo);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "Login";
            this.Opacity = 0.9D;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.MouseDown += new System.Windows.Forms.MouseEventHandler(this.Login_MouseDown);
            ((System.ComponentModel.ISupportInitialize)(this.pictCerrarLogin)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictMinimizarLogin)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private Panel panelLogo;
        private TextBox txtUsuario;
        private TextBox txtContraseña;
        private Label label1;
        private Button btnAcceder;
        private PictureBox pictCerrarLogin;
        private PictureBox pictMinimizarLogin;
        private AltoControls.CircularPB circularpb1;
        private System.Windows.Forms.Timer timer1;
        private Label label2;
    }
}