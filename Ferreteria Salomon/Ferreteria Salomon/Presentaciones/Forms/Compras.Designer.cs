namespace Ferreteria_Salomon.Presentaciones.Forms
{
    partial class Compras
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
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
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label12 = new System.Windows.Forms.Label();
            this.dataGridViewCompras = new System.Windows.Forms.DataGridView();
            this.btnListarCompra = new System.Windows.Forms.Button();
            this.btnBuscarCompra = new System.Windows.Forms.Button();
            this.btnRegistrarCompra = new System.Windows.Forms.Button();
            this.label20 = new System.Windows.Forms.Label();
            this.txtTotalCompra = new System.Windows.Forms.TextBox();
            this.txtIdProveedor = new System.Windows.Forms.TextBox();
            this.txtFechaCompra = new System.Windows.Forms.TextBox();
            this.txtIdCompra = new System.Windows.Forms.TextBox();
            this.label15 = new System.Windows.Forms.Label();
            this.label16 = new System.Windows.Forms.Label();
            this.label17 = new System.Windows.Forms.Label();
            this.label18 = new System.Windows.Forms.Label();
            this.columnIdCompras = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.columnFechaCompras = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.columnIDPROVEEDOR = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.columnTotalCompras = new System.Windows.Forms.DataGridViewTextBoxColumn();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewCompras)).BeginInit();
            this.SuspendLayout();
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Font = new System.Drawing.Font("Century Gothic", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.label12.ForeColor = System.Drawing.Color.Transparent;
            this.label12.Location = new System.Drawing.Point(793, 72);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(64, 30);
            this.label12.TabIndex = 75;
            this.label12.Text = "Lista";
            // 
            // dataGridViewCompras
            // 
            this.dataGridViewCompras.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridViewCompras.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.columnIdCompras,
            this.columnFechaCompras,
            this.columnIDPROVEEDOR,
            this.columnTotalCompras});
            this.dataGridViewCompras.Cursor = System.Windows.Forms.Cursors.Hand;
            this.dataGridViewCompras.Location = new System.Drawing.Point(653, 140);
            this.dataGridViewCompras.Name = "dataGridViewCompras";
            this.dataGridViewCompras.RowHeadersWidth = 51;
            this.dataGridViewCompras.RowTemplate.Height = 29;
            this.dataGridViewCompras.Size = new System.Drawing.Size(518, 263);
            this.dataGridViewCompras.TabIndex = 74;
            // 
            // btnListarCompra
            // 
            this.btnListarCompra.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnListarCompra.Location = new System.Drawing.Point(793, 689);
            this.btnListarCompra.Name = "btnListarCompra";
            this.btnListarCompra.Size = new System.Drawing.Size(109, 33);
            this.btnListarCompra.TabIndex = 73;
            this.btnListarCompra.Text = "Listar";
            this.btnListarCompra.UseVisualStyleBackColor = true;
            // 
            // btnBuscarCompra
            // 
            this.btnBuscarCompra.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnBuscarCompra.Location = new System.Drawing.Point(280, 689);
            this.btnBuscarCompra.Name = "btnBuscarCompra";
            this.btnBuscarCompra.Size = new System.Drawing.Size(109, 33);
            this.btnBuscarCompra.TabIndex = 70;
            this.btnBuscarCompra.Text = "Buscar";
            this.btnBuscarCompra.UseVisualStyleBackColor = true;
            // 
            // btnRegistrarCompra
            // 
            this.btnRegistrarCompra.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnRegistrarCompra.Location = new System.Drawing.Point(105, 689);
            this.btnRegistrarCompra.Name = "btnRegistrarCompra";
            this.btnRegistrarCompra.Size = new System.Drawing.Size(109, 33);
            this.btnRegistrarCompra.TabIndex = 69;
            this.btnRegistrarCompra.Text = "Registrar";
            this.btnRegistrarCompra.UseVisualStyleBackColor = true;
            // 
            // label20
            // 
            this.label20.AutoSize = true;
            this.label20.Font = new System.Drawing.Font("Century Gothic", 16F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.label20.ForeColor = System.Drawing.Color.Transparent;
            this.label20.Location = new System.Drawing.Point(341, 55);
            this.label20.Name = "label20";
            this.label20.Size = new System.Drawing.Size(135, 33);
            this.label20.TabIndex = 68;
            this.label20.Text = "Compras";
            // 
            // txtTotalCompra
            // 
            this.txtTotalCompra.Cursor = System.Windows.Forms.Cursors.Hand;
            this.txtTotalCompra.Location = new System.Drawing.Point(248, 377);
            this.txtTotalCompra.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.txtTotalCompra.Name = "txtTotalCompra";
            this.txtTotalCompra.Size = new System.Drawing.Size(199, 27);
            this.txtTotalCompra.TabIndex = 67;
            // 
            // txtIdProveedor
            // 
            this.txtIdProveedor.Cursor = System.Windows.Forms.Cursors.Hand;
            this.txtIdProveedor.Location = new System.Drawing.Point(248, 299);
            this.txtIdProveedor.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.txtIdProveedor.Name = "txtIdProveedor";
            this.txtIdProveedor.Size = new System.Drawing.Size(199, 27);
            this.txtIdProveedor.TabIndex = 66;
            // 
            // txtFechaCompra
            // 
            this.txtFechaCompra.Cursor = System.Windows.Forms.Cursors.Hand;
            this.txtFechaCompra.Location = new System.Drawing.Point(248, 229);
            this.txtFechaCompra.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.txtFechaCompra.Name = "txtFechaCompra";
            this.txtFechaCompra.Size = new System.Drawing.Size(199, 27);
            this.txtFechaCompra.TabIndex = 65;
            // 
            // txtIdCompra
            // 
            this.txtIdCompra.Cursor = System.Windows.Forms.Cursors.Hand;
            this.txtIdCompra.Location = new System.Drawing.Point(248, 161);
            this.txtIdCompra.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.txtIdCompra.Name = "txtIdCompra";
            this.txtIdCompra.Size = new System.Drawing.Size(199, 27);
            this.txtIdCompra.TabIndex = 64;
            // 
            // label15
            // 
            this.label15.AutoSize = true;
            this.label15.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.label15.Font = new System.Drawing.Font("Century Gothic", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.label15.ForeColor = System.Drawing.Color.Transparent;
            this.label15.Location = new System.Drawing.Point(26, 380);
            this.label15.Name = "label15";
            this.label15.Size = new System.Drawing.Size(205, 23);
            this.label15.TabIndex = 63;
            this.label15.Text = "Total de la compra:";
            // 
            // label16
            // 
            this.label16.AutoSize = true;
            this.label16.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.label16.Font = new System.Drawing.Font("Century Gothic", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.label16.ForeColor = System.Drawing.Color.Transparent;
            this.label16.Location = new System.Drawing.Point(26, 301);
            this.label16.Name = "label16";
            this.label16.Size = new System.Drawing.Size(184, 23);
            this.label16.TabIndex = 62;
            this.label16.Text = "ID del proveedor:";
            // 
            // label17
            // 
            this.label17.AutoSize = true;
            this.label17.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.label17.Font = new System.Drawing.Font("Century Gothic", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.label17.ForeColor = System.Drawing.Color.Transparent;
            this.label17.Location = new System.Drawing.Point(26, 232);
            this.label17.Name = "label17";
            this.label17.Size = new System.Drawing.Size(215, 23);
            this.label17.TabIndex = 61;
            this.label17.Text = "Fecha de la compra";
            // 
            // label18
            // 
            this.label18.AutoSize = true;
            this.label18.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.label18.Font = new System.Drawing.Font("Century Gothic", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.label18.ForeColor = System.Drawing.Color.Transparent;
            this.label18.Location = new System.Drawing.Point(26, 159);
            this.label18.Name = "label18";
            this.label18.Size = new System.Drawing.Size(178, 23);
            this.label18.TabIndex = 60;
            this.label18.Text = "ID de la compra:";
            // 
            // columnIdCompras
            // 
            this.columnIdCompras.HeaderText = "ID de la compra";
            this.columnIdCompras.MinimumWidth = 6;
            this.columnIdCompras.Name = "columnIdCompras";
            this.columnIdCompras.ReadOnly = true;
            this.columnIdCompras.Width = 125;
            // 
            // columnFechaCompras
            // 
            this.columnFechaCompras.HeaderText = "Fecha de la compra";
            this.columnFechaCompras.MinimumWidth = 6;
            this.columnFechaCompras.Name = "columnFechaCompras";
            this.columnFechaCompras.ReadOnly = true;
            this.columnFechaCompras.Width = 125;
            // 
            // columnIDPROVEEDOR
            // 
            this.columnIDPROVEEDOR.HeaderText = "ID del proveedor";
            this.columnIDPROVEEDOR.MinimumWidth = 6;
            this.columnIDPROVEEDOR.Name = "columnIDPROVEEDOR";
            this.columnIDPROVEEDOR.ReadOnly = true;
            this.columnIDPROVEEDOR.Width = 125;
            // 
            // columnTotalCompras
            // 
            this.columnTotalCompras.HeaderText = "Total de la compra";
            this.columnTotalCompras.MinimumWidth = 6;
            this.columnTotalCompras.Name = "columnTotalCompras";
            this.columnTotalCompras.ReadOnly = true;
            this.columnTotalCompras.Width = 125;
            // 
            // Compras
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(117)))), ((int)(((byte)(156)))), ((int)(((byte)(210)))));
            this.ClientSize = new System.Drawing.Size(1170, 777);
            this.Controls.Add(this.label12);
            this.Controls.Add(this.dataGridViewCompras);
            this.Controls.Add(this.btnListarCompra);
            this.Controls.Add(this.btnBuscarCompra);
            this.Controls.Add(this.btnRegistrarCompra);
            this.Controls.Add(this.label20);
            this.Controls.Add(this.txtTotalCompra);
            this.Controls.Add(this.txtIdProveedor);
            this.Controls.Add(this.txtFechaCompra);
            this.Controls.Add(this.txtIdCompra);
            this.Controls.Add(this.label15);
            this.Controls.Add(this.label16);
            this.Controls.Add(this.label17);
            this.Controls.Add(this.label18);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Margin = new System.Windows.Forms.Padding(3, 4, 3, 4);
            this.Name = "Compras";
            this.Text = "Compras";
            ((System.ComponentModel.ISupportInitialize)(this.dataGridViewCompras)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private Label label12;
        private DataGridView dataGridViewCompras;
        private Button btnListarCompra;
        private Button btnBuscarCompra;
        private Button btnRegistrarCompra;
        private Label label20;
        private TextBox txtTotalCompra;
        private TextBox txtIdProveedor;
        private TextBox txtFechaCompra;
        private TextBox txtIdCompra;
        private Label label15;
        private Label label16;
        private Label label17;
        private Label label18;
        private DataGridViewTextBoxColumn columnIdCompras;
        private DataGridViewTextBoxColumn columnFechaCompras;
        private DataGridViewTextBoxColumn columnIDPROVEEDOR;
        private DataGridViewTextBoxColumn columnTotalCompras;
    }
}