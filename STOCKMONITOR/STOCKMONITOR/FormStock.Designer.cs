namespace STOCKMONITOR
{
    partial class FormStock
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
            this.components = new System.ComponentModel.Container();
            this.panel1 = new System.Windows.Forms.Panel();
            this.textBox4 = new System.Windows.Forms.TextBox();
            this.textBox3 = new System.Windows.Forms.TextBox();
            this.textBox2 = new System.Windows.Forms.TextBox();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.btnExit = new System.Windows.Forms.Button();
            this.btnReset = new System.Windows.Forms.Button();
            this.gvPriceTable = new System.Windows.Forms.DataGridView();
            this.mACPDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.gIAMUA3DataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.kLMUA3DataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.gIAMUA2DataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.kLMUA2DataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.gIAMUA1DataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.kLMUA1DataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.gIAKHOPDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.kLKHOPDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.gIABAN1DataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.kLBAN1DataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.gIABAN2DataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.kLBAN2DataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.gIABAN3DataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.kLBAN3DataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.gIATRUCTUYENBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.dS = new STOCKMONITOR.DS();
            this.panel2 = new System.Windows.Forms.Panel();
            this.btnCancel = new System.Windows.Forms.Button();
            this.btnReload = new System.Windows.Forms.Button();
            this.gvTrade = new System.Windows.Forms.DataGridView();
            this.panel3 = new System.Windows.Forms.Panel();
            this.cbStockId = new System.Windows.Forms.ComboBox();
            this.txtTime = new System.Windows.Forms.Label();
            this.cbType = new System.Windows.Forms.ComboBox();
            this.tbPrice = new System.Windows.Forms.TextBox();
            this.tbQuantity = new System.Windows.Forms.TextBox();
            this.btnTrade = new System.Windows.Forms.Button();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.radBtnSell = new System.Windows.Forms.RadioButton();
            this.radBtnBuy = new System.Windows.Forms.RadioButton();
            this.timer1 = new System.Windows.Forms.Timer(this.components);
            this.gIATRUCTUYENTableAdapter = new STOCKMONITOR.DSTableAdapters.GIATRUCTUYENTableAdapter();
            this.tableAdapterManager = new STOCKMONITOR.DSTableAdapters.TableAdapterManager();
            this.panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.gvPriceTable)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.gIATRUCTUYENBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dS)).BeginInit();
            this.panel2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.gvTrade)).BeginInit();
            this.panel3.SuspendLayout();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(192)))), ((int)(((byte)(192)))));
            this.panel1.Controls.Add(this.textBox4);
            this.panel1.Controls.Add(this.textBox3);
            this.panel1.Controls.Add(this.textBox2);
            this.panel1.Controls.Add(this.textBox1);
            this.panel1.Controls.Add(this.btnExit);
            this.panel1.Controls.Add(this.btnReset);
            this.panel1.Controls.Add(this.gvPriceTable);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.panel1.Location = new System.Drawing.Point(0, 392);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(1373, 381);
            this.panel1.TabIndex = 0;
            // 
            // textBox4
            // 
            this.textBox4.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.textBox4.Location = new System.Drawing.Point(0, 3);
            this.textBox4.Name = "textBox4";
            this.textBox4.Size = new System.Drawing.Size(138, 34);
            this.textBox4.TabIndex = 13;
            // 
            // textBox3
            // 
            this.textBox3.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.textBox3.Font = new System.Drawing.Font("Times New Roman", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox3.Location = new System.Drawing.Point(843, 3);
            this.textBox3.Name = "textBox3";
            this.textBox3.Size = new System.Drawing.Size(530, 34);
            this.textBox3.TabIndex = 12;
            this.textBox3.Text = "Asked";
            this.textBox3.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // textBox2
            // 
            this.textBox2.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.textBox2.Font = new System.Drawing.Font("Times New Roman", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox2.Location = new System.Drawing.Point(666, 3);
            this.textBox2.Name = "textBox2";
            this.textBox2.Size = new System.Drawing.Size(179, 34);
            this.textBox2.TabIndex = 11;
            this.textBox2.Text = "Matched";
            this.textBox2.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // textBox1
            // 
            this.textBox1.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.textBox1.Font = new System.Drawing.Font("Times New Roman", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.textBox1.Location = new System.Drawing.Point(137, 3);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(532, 34);
            this.textBox1.TabIndex = 10;
            this.textBox1.Text = "Bid";
            this.textBox1.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // btnExit
            // 
            this.btnExit.Location = new System.Drawing.Point(1193, 330);
            this.btnExit.Margin = new System.Windows.Forms.Padding(4);
            this.btnExit.Name = "btnExit";
            this.btnExit.Size = new System.Drawing.Size(100, 38);
            this.btnExit.TabIndex = 9;
            this.btnExit.Text = "Exit";
            this.btnExit.UseVisualStyleBackColor = true;
            this.btnExit.Click += new System.EventHandler(this.btnExit_Click);
            // 
            // btnReset
            // 
            this.btnReset.Location = new System.Drawing.Point(1085, 330);
            this.btnReset.Margin = new System.Windows.Forms.Padding(4);
            this.btnReset.Name = "btnReset";
            this.btnReset.Size = new System.Drawing.Size(100, 38);
            this.btnReset.TabIndex = 8;
            this.btnReset.Text = "Reset";
            this.btnReset.UseVisualStyleBackColor = true;
            this.btnReset.Click += new System.EventHandler(this.btnReset_Click);
            // 
            // gvPriceTable
            // 
            this.gvPriceTable.AllowUserToAddRows = false;
            this.gvPriceTable.AllowUserToDeleteRows = false;
            this.gvPriceTable.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.gvPriceTable.AutoGenerateColumns = false;
            this.gvPriceTable.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.gvPriceTable.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.gvPriceTable.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.mACPDataGridViewTextBoxColumn,
            this.gIAMUA3DataGridViewTextBoxColumn,
            this.kLMUA3DataGridViewTextBoxColumn,
            this.gIAMUA2DataGridViewTextBoxColumn,
            this.kLMUA2DataGridViewTextBoxColumn,
            this.gIAMUA1DataGridViewTextBoxColumn,
            this.kLMUA1DataGridViewTextBoxColumn,
            this.gIAKHOPDataGridViewTextBoxColumn,
            this.kLKHOPDataGridViewTextBoxColumn,
            this.gIABAN1DataGridViewTextBoxColumn,
            this.kLBAN1DataGridViewTextBoxColumn,
            this.gIABAN2DataGridViewTextBoxColumn,
            this.kLBAN2DataGridViewTextBoxColumn,
            this.gIABAN3DataGridViewTextBoxColumn,
            this.kLBAN3DataGridViewTextBoxColumn});
            this.gvPriceTable.DataSource = this.gIATRUCTUYENBindingSource;
            this.gvPriceTable.Location = new System.Drawing.Point(0, 35);
            this.gvPriceTable.Name = "gvPriceTable";
            this.gvPriceTable.ReadOnly = true;
            this.gvPriceTable.RowHeadersWidth = 51;
            this.gvPriceTable.RowTemplate.Height = 24;
            this.gvPriceTable.Size = new System.Drawing.Size(1373, 276);
            this.gvPriceTable.TabIndex = 0;
            // 
            // mACPDataGridViewTextBoxColumn
            // 
            this.mACPDataGridViewTextBoxColumn.DataPropertyName = "MACP";
            this.mACPDataGridViewTextBoxColumn.HeaderText = "Symbol";
            this.mACPDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.mACPDataGridViewTextBoxColumn.Name = "mACPDataGridViewTextBoxColumn";
            this.mACPDataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // gIAMUA3DataGridViewTextBoxColumn
            // 
            this.gIAMUA3DataGridViewTextBoxColumn.DataPropertyName = "GIAMUA3";
            this.gIAMUA3DataGridViewTextBoxColumn.HeaderText = "P3";
            this.gIAMUA3DataGridViewTextBoxColumn.MinimumWidth = 6;
            this.gIAMUA3DataGridViewTextBoxColumn.Name = "gIAMUA3DataGridViewTextBoxColumn";
            this.gIAMUA3DataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // kLMUA3DataGridViewTextBoxColumn
            // 
            this.kLMUA3DataGridViewTextBoxColumn.DataPropertyName = "KLMUA3";
            this.kLMUA3DataGridViewTextBoxColumn.HeaderText = "Vol3";
            this.kLMUA3DataGridViewTextBoxColumn.MinimumWidth = 6;
            this.kLMUA3DataGridViewTextBoxColumn.Name = "kLMUA3DataGridViewTextBoxColumn";
            this.kLMUA3DataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // gIAMUA2DataGridViewTextBoxColumn
            // 
            this.gIAMUA2DataGridViewTextBoxColumn.DataPropertyName = "GIAMUA2";
            this.gIAMUA2DataGridViewTextBoxColumn.HeaderText = "P2";
            this.gIAMUA2DataGridViewTextBoxColumn.MinimumWidth = 6;
            this.gIAMUA2DataGridViewTextBoxColumn.Name = "gIAMUA2DataGridViewTextBoxColumn";
            this.gIAMUA2DataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // kLMUA2DataGridViewTextBoxColumn
            // 
            this.kLMUA2DataGridViewTextBoxColumn.DataPropertyName = "KLMUA2";
            this.kLMUA2DataGridViewTextBoxColumn.HeaderText = "Vol2";
            this.kLMUA2DataGridViewTextBoxColumn.MinimumWidth = 6;
            this.kLMUA2DataGridViewTextBoxColumn.Name = "kLMUA2DataGridViewTextBoxColumn";
            this.kLMUA2DataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // gIAMUA1DataGridViewTextBoxColumn
            // 
            this.gIAMUA1DataGridViewTextBoxColumn.DataPropertyName = "GIAMUA1";
            this.gIAMUA1DataGridViewTextBoxColumn.HeaderText = "P1";
            this.gIAMUA1DataGridViewTextBoxColumn.MinimumWidth = 6;
            this.gIAMUA1DataGridViewTextBoxColumn.Name = "gIAMUA1DataGridViewTextBoxColumn";
            this.gIAMUA1DataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // kLMUA1DataGridViewTextBoxColumn
            // 
            this.kLMUA1DataGridViewTextBoxColumn.DataPropertyName = "KLMUA1";
            this.kLMUA1DataGridViewTextBoxColumn.HeaderText = "Vol1";
            this.kLMUA1DataGridViewTextBoxColumn.MinimumWidth = 6;
            this.kLMUA1DataGridViewTextBoxColumn.Name = "kLMUA1DataGridViewTextBoxColumn";
            this.kLMUA1DataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // gIAKHOPDataGridViewTextBoxColumn
            // 
            this.gIAKHOPDataGridViewTextBoxColumn.DataPropertyName = "GIAKHOP";
            this.gIAKHOPDataGridViewTextBoxColumn.HeaderText = "Price";
            this.gIAKHOPDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.gIAKHOPDataGridViewTextBoxColumn.Name = "gIAKHOPDataGridViewTextBoxColumn";
            this.gIAKHOPDataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // kLKHOPDataGridViewTextBoxColumn
            // 
            this.kLKHOPDataGridViewTextBoxColumn.DataPropertyName = "KLKHOP";
            this.kLKHOPDataGridViewTextBoxColumn.HeaderText = "Vol";
            this.kLKHOPDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.kLKHOPDataGridViewTextBoxColumn.Name = "kLKHOPDataGridViewTextBoxColumn";
            this.kLKHOPDataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // gIABAN1DataGridViewTextBoxColumn
            // 
            this.gIABAN1DataGridViewTextBoxColumn.DataPropertyName = "GIABAN1";
            this.gIABAN1DataGridViewTextBoxColumn.HeaderText = "P1";
            this.gIABAN1DataGridViewTextBoxColumn.MinimumWidth = 6;
            this.gIABAN1DataGridViewTextBoxColumn.Name = "gIABAN1DataGridViewTextBoxColumn";
            this.gIABAN1DataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // kLBAN1DataGridViewTextBoxColumn
            // 
            this.kLBAN1DataGridViewTextBoxColumn.DataPropertyName = "KLBAN1";
            this.kLBAN1DataGridViewTextBoxColumn.HeaderText = "Vol1";
            this.kLBAN1DataGridViewTextBoxColumn.MinimumWidth = 6;
            this.kLBAN1DataGridViewTextBoxColumn.Name = "kLBAN1DataGridViewTextBoxColumn";
            this.kLBAN1DataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // gIABAN2DataGridViewTextBoxColumn
            // 
            this.gIABAN2DataGridViewTextBoxColumn.DataPropertyName = "GIABAN2";
            this.gIABAN2DataGridViewTextBoxColumn.HeaderText = "P2";
            this.gIABAN2DataGridViewTextBoxColumn.MinimumWidth = 6;
            this.gIABAN2DataGridViewTextBoxColumn.Name = "gIABAN2DataGridViewTextBoxColumn";
            this.gIABAN2DataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // kLBAN2DataGridViewTextBoxColumn
            // 
            this.kLBAN2DataGridViewTextBoxColumn.DataPropertyName = "KLBAN2";
            this.kLBAN2DataGridViewTextBoxColumn.HeaderText = "Vol2";
            this.kLBAN2DataGridViewTextBoxColumn.MinimumWidth = 6;
            this.kLBAN2DataGridViewTextBoxColumn.Name = "kLBAN2DataGridViewTextBoxColumn";
            this.kLBAN2DataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // gIABAN3DataGridViewTextBoxColumn
            // 
            this.gIABAN3DataGridViewTextBoxColumn.DataPropertyName = "GIABAN3";
            this.gIABAN3DataGridViewTextBoxColumn.HeaderText = "P3";
            this.gIABAN3DataGridViewTextBoxColumn.MinimumWidth = 6;
            this.gIABAN3DataGridViewTextBoxColumn.Name = "gIABAN3DataGridViewTextBoxColumn";
            this.gIABAN3DataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // kLBAN3DataGridViewTextBoxColumn
            // 
            this.kLBAN3DataGridViewTextBoxColumn.DataPropertyName = "KLBAN3";
            this.kLBAN3DataGridViewTextBoxColumn.HeaderText = "Vol3";
            this.kLBAN3DataGridViewTextBoxColumn.MinimumWidth = 6;
            this.kLBAN3DataGridViewTextBoxColumn.Name = "kLBAN3DataGridViewTextBoxColumn";
            this.kLBAN3DataGridViewTextBoxColumn.ReadOnly = true;
            // 
            // gIATRUCTUYENBindingSource
            // 
            this.gIATRUCTUYENBindingSource.DataMember = "GIATRUCTUYEN";
            this.gIATRUCTUYENBindingSource.DataSource = this.dS;
            // 
            // dS
            // 
            this.dS.DataSetName = "DS";
            this.dS.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // panel2
            // 
            this.panel2.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.panel2.Controls.Add(this.btnCancel);
            this.panel2.Controls.Add(this.btnReload);
            this.panel2.Controls.Add(this.gvTrade);
            this.panel2.Location = new System.Drawing.Point(470, 12);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(903, 373);
            this.panel2.TabIndex = 1;
            // 
            // btnCancel
            // 
            this.btnCancel.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnCancel.Location = new System.Drawing.Point(108, 4);
            this.btnCancel.Margin = new System.Windows.Forms.Padding(4);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(100, 38);
            this.btnCancel.TabIndex = 8;
            this.btnCancel.Text = "Cancel";
            this.btnCancel.UseVisualStyleBackColor = true;
            this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
            // 
            // btnReload
            // 
            this.btnReload.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnReload.Location = new System.Drawing.Point(0, 4);
            this.btnReload.Margin = new System.Windows.Forms.Padding(4);
            this.btnReload.Name = "btnReload";
            this.btnReload.Size = new System.Drawing.Size(100, 38);
            this.btnReload.TabIndex = 7;
            this.btnReload.Text = "Reload";
            this.btnReload.UseVisualStyleBackColor = true;
            this.btnReload.Click += new System.EventHandler(this.btnReload_Click);
            // 
            // gvTrade
            // 
            this.gvTrade.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.AllCells;
            this.gvTrade.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.gvTrade.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.gvTrade.Location = new System.Drawing.Point(0, 49);
            this.gvTrade.Name = "gvTrade";
            this.gvTrade.RowHeadersWidth = 51;
            this.gvTrade.RowTemplate.Height = 24;
            this.gvTrade.Size = new System.Drawing.Size(903, 324);
            this.gvTrade.TabIndex = 0;
            // 
            // panel3
            // 
            this.panel3.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left)));
            this.panel3.BackColor = System.Drawing.Color.White;
            this.panel3.Controls.Add(this.cbStockId);
            this.panel3.Controls.Add(this.txtTime);
            this.panel3.Controls.Add(this.cbType);
            this.panel3.Controls.Add(this.tbPrice);
            this.panel3.Controls.Add(this.tbQuantity);
            this.panel3.Controls.Add(this.btnTrade);
            this.panel3.Controls.Add(this.label4);
            this.panel3.Controls.Add(this.label3);
            this.panel3.Controls.Add(this.label2);
            this.panel3.Controls.Add(this.label1);
            this.panel3.Controls.Add(this.radBtnSell);
            this.panel3.Controls.Add(this.radBtnBuy);
            this.panel3.Location = new System.Drawing.Point(13, 13);
            this.panel3.Margin = new System.Windows.Forms.Padding(4);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(450, 372);
            this.panel3.TabIndex = 2;
            // 
            // cbStockId
            // 
            this.cbStockId.FormattingEnabled = true;
            this.cbStockId.Location = new System.Drawing.Point(185, 58);
            this.cbStockId.Name = "cbStockId";
            this.cbStockId.Size = new System.Drawing.Size(153, 34);
            this.cbStockId.TabIndex = 14;
            this.cbStockId.Text = "MBB";
            // 
            // txtTime
            // 
            this.txtTime.AutoSize = true;
            this.txtTime.Location = new System.Drawing.Point(116, 9);
            this.txtTime.Name = "txtTime";
            this.txtTime.Size = new System.Drawing.Size(60, 27);
            this.txtTime.TabIndex = 13;
            this.txtTime.Text = "Time";
            this.txtTime.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            // 
            // cbType
            // 
            this.cbType.FormattingEnabled = true;
            this.cbType.Location = new System.Drawing.Point(185, 108);
            this.cbType.Name = "cbType";
            this.cbType.Size = new System.Drawing.Size(153, 34);
            this.cbType.TabIndex = 12;
            this.cbType.Text = "LO";
            // 
            // tbPrice
            // 
            this.tbPrice.Location = new System.Drawing.Point(184, 160);
            this.tbPrice.Margin = new System.Windows.Forms.Padding(4);
            this.tbPrice.Name = "tbPrice";
            this.tbPrice.Size = new System.Drawing.Size(153, 34);
            this.tbPrice.TabIndex = 10;
            this.tbPrice.Text = "10000";
            this.tbPrice.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.tbPrice_KeyPress);
            // 
            // tbQuantity
            // 
            this.tbQuantity.Location = new System.Drawing.Point(184, 211);
            this.tbQuantity.Margin = new System.Windows.Forms.Padding(4);
            this.tbQuantity.Name = "tbQuantity";
            this.tbQuantity.Size = new System.Drawing.Size(153, 34);
            this.tbQuantity.TabIndex = 9;
            this.tbQuantity.Text = "1000";
            this.tbQuantity.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.tbQuantity_KeyPress);
            // 
            // btnTrade
            // 
            this.btnTrade.Location = new System.Drawing.Point(166, 313);
            this.btnTrade.Margin = new System.Windows.Forms.Padding(4);
            this.btnTrade.Name = "btnTrade";
            this.btnTrade.Size = new System.Drawing.Size(100, 38);
            this.btnTrade.TabIndex = 6;
            this.btnTrade.Text = "Submit";
            this.btnTrade.UseVisualStyleBackColor = true;
            this.btnTrade.Click += new System.EventHandler(this.btnTrade_Click);
            // 
            // label4
            // 
            this.label4.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(114, 163);
            this.label4.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(62, 27);
            this.label4.TabIndex = 5;
            this.label4.Text = "Price";
            // 
            // label3
            // 
            this.label3.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(94, 61);
            this.label3.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(84, 27);
            this.label3.TabIndex = 4;
            this.label3.Text = "Symbol";
            // 
            // label2
            // 
            this.label2.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(82, 214);
            this.label2.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(96, 27);
            this.label2.TabIndex = 3;
            this.label2.Text = "Quantity";
            // 
            // label1
            // 
            this.label1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(119, 111);
            this.label1.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(59, 27);
            this.label1.TabIndex = 2;
            this.label1.Text = "Type";
            // 
            // radBtnSell
            // 
            this.radBtnSell.AutoSize = true;
            this.radBtnSell.Location = new System.Drawing.Point(249, 263);
            this.radBtnSell.Margin = new System.Windows.Forms.Padding(4);
            this.radBtnSell.Name = "radBtnSell";
            this.radBtnSell.Size = new System.Drawing.Size(90, 31);
            this.radBtnSell.TabIndex = 1;
            this.radBtnSell.Text = "SELL";
            this.radBtnSell.UseVisualStyleBackColor = true;
            // 
            // radBtnBuy
            // 
            this.radBtnBuy.AutoSize = true;
            this.radBtnBuy.Checked = true;
            this.radBtnBuy.Location = new System.Drawing.Point(124, 263);
            this.radBtnBuy.Margin = new System.Windows.Forms.Padding(4);
            this.radBtnBuy.Name = "radBtnBuy";
            this.radBtnBuy.Size = new System.Drawing.Size(82, 31);
            this.radBtnBuy.TabIndex = 0;
            this.radBtnBuy.TabStop = true;
            this.radBtnBuy.Text = "BUY";
            this.radBtnBuy.UseVisualStyleBackColor = true;
            // 
            // timer1
            // 
            this.timer1.Enabled = true;
            this.timer1.Tick += new System.EventHandler(this.timer1_Tick);
            // 
            // gIATRUCTUYENTableAdapter
            // 
            this.gIATRUCTUYENTableAdapter.ClearBeforeFill = true;
            // 
            // tableAdapterManager
            // 
            this.tableAdapterManager.BackupDataSetBeforeUpdate = false;
            this.tableAdapterManager.GIATRUCTUYENTableAdapter = this.gIATRUCTUYENTableAdapter;
            this.tableAdapterManager.LENHDATTableAdapter = null;
            this.tableAdapterManager.LENHKHOPTableAdapter = null;
            this.tableAdapterManager.UpdateOrder = STOCKMONITOR.DSTableAdapters.TableAdapterManager.UpdateOrderOption.InsertUpdateDelete;
            // 
            // FormStock
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(13F, 26F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1373, 773);
            this.Controls.Add(this.panel3);
            this.Controls.Add(this.panel2);
            this.Controls.Add(this.panel1);
            this.Font = new System.Drawing.Font("Times New Roman", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Margin = new System.Windows.Forms.Padding(5);
            this.Name = "FormStock";
            this.Text = "Stock Monitor";
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.FormStock_FormClosed);
            this.Load += new System.EventHandler(this.FormStock_Load);
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.gvPriceTable)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.gIATRUCTUYENBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dS)).EndInit();
            this.panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.gvTrade)).EndInit();
            this.panel3.ResumeLayout(false);
            this.panel3.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.ComboBox cbType;
        private System.Windows.Forms.TextBox tbPrice;
        private System.Windows.Forms.TextBox tbQuantity;
        private System.Windows.Forms.Button btnTrade;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.RadioButton radBtnSell;
        private System.Windows.Forms.RadioButton radBtnBuy;
        private System.Windows.Forms.DataGridView gvPriceTable;
        private System.Windows.Forms.DataGridView gvTrade;
        private System.Windows.Forms.Label txtTime;
        private System.Windows.Forms.Timer timer1;
        private DS dS;
        private System.Windows.Forms.BindingSource gIATRUCTUYENBindingSource;
        private DSTableAdapters.GIATRUCTUYENTableAdapter gIATRUCTUYENTableAdapter;
        private DSTableAdapters.TableAdapterManager tableAdapterManager;
        private System.Windows.Forms.DataGridViewTextBoxColumn mACPDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn gIAMUA3DataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn kLMUA3DataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn gIAMUA2DataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn kLMUA2DataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn gIAMUA1DataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn kLMUA1DataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn gIAKHOPDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn kLKHOPDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn gIABAN1DataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn kLBAN1DataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn gIABAN2DataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn kLBAN2DataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn gIABAN3DataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn kLBAN3DataGridViewTextBoxColumn;
        private System.Windows.Forms.ComboBox cbStockId;
        private System.Windows.Forms.Button btnCancel;
        private System.Windows.Forms.Button btnReload;
        private System.Windows.Forms.Button btnExit;
        private System.Windows.Forms.Button btnReset;
        private System.Windows.Forms.TextBox textBox3;
        private System.Windows.Forms.TextBox textBox2;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.TextBox textBox4;
    }
}

