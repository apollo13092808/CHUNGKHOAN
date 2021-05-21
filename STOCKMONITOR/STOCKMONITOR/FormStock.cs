using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Security.Permissions;

namespace STOCKMONITOR
{
    public partial class FormStock : Form
    {
        private int changeCount = 0;
        private const string tableName = "TRUCTUYEN";
        public static SqlConnection conn = null;
        public static SqlCommand sqlcmd = null;
        public DataSet dataToWatch;

        public object Interaction { get; private set; }

        private bool CanRequestNotifications()
        {
            // In order to use the callback feature of the
            // SqlDependency, the application must have
            // the SqlClientPermission permission.
            try
            {
                SqlClientPermission perm = new SqlClientPermission(PermissionState.Unrestricted);
                perm.Demand();
                return true;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                return false;
            }
        }

        private string GetConnectionString()
        {
            // To avoid storing the connection string in your code,
            // you can retrive it from a configuration file.
            // Return "Data Source=THU-PC\TINTIN;Initial Catalog=QLVT;Persist Security Info=True;User ID=sa;Password=kc;Pooling = false"

            //string conns = "Data Source=APOLLO;Initial Catalog =STOCKMONITOR; User ID =sa; Password=1309";
            return @"Data Source=APOLLO;Initial Catalog=STOCKMONITOR;User ID=sa;Password=1309;Integrated Security=false";
        }
        private string GetSQL()
        {
            return "select MACP, GIAMUA3, KLMUA3, GIAMUA2, KLMUA2, GIAMUA1, KLMUA1, GIAKHOP, KLKHOP, GIABAN1, KLBAN1, GIABAN2, KLBAN2, GIABAN3, KLBAN3 from dbo.TRUCTUYEN";
        }

        public FormStock()
        {
            InitializeComponent();
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            DateTime dateTime = DateTime.Now; //thời gian hiện tại
            txtTime.Text = String.Format("Today: {0:dd/MM/yyyy  HH:mm:ss}", dateTime);
        }

        private void FormStock_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'dS.GIATRUCTUYEN' table. You can move, or remove it, as needed.
            //this.gIATRUCTUYENTableAdapter.Fill(this.dS.GIATRUCTUYEN);

            cbStockId.Items.Add("MBB");
            cbStockId.Items.Add("BID");
            cbStockId.Items.Add("FPT");
            cbStockId.Items.Add("HDP");
            cbStockId.Items.Add("CTG");
            cbStockId.Items.Add("BVH");
            cbStockId.SelectedIndex = 0;

            cbType.Items.Add("LO");
            cbType.SelectedIndex = 0;
            cbType.Enabled = false;

            if (CanRequestNotifications() == true)
                BatDau();
            else
                MessageBox.Show("Service Broker not activated.", "Notification", MessageBoxButtons.OK);

            LoadLenhDat();
            ResetGIATRUCTUYEN();
        }

        private void dependency_OnChange(object sender, SqlNotificationEventArgs e)
        {

            // This event will occur on a thread pool thread.
            // It is illegal to update the UI from a worker thread//Cập nhật giao diện người dùng khi nó thay đổ
            // The following code checks to see if it is safe update the UI.
            ISynchronizeInvoke i = (ISynchronizeInvoke)this;

            // If InvokeRequired returns True, the code is executing on a worker thread.
            if (i.InvokeRequired)
            {
                // Create a delegate to perform the thread switch
                OnChangeEventHandler tempDelegate = new OnChangeEventHandler(dependency_OnChange);

                object[] args = new[] { sender, e };

                // Marshal the data from the worker thread
                // to the UI thread.
                //sẽ lên lịch cho hành động không đồng bộ trên luồng GUI.
                i.BeginInvoke(tempDelegate, args);

                return;
            }

            SqlDependency dependency = (SqlDependency)sender;

            dependency.OnChange -= dependency_OnChange;

            changeCount += 1;

            // Reload the dataset that's bound to the grid.
            GetData();


        }

        private void GetData()
        {
            // Làm trống dữ liệu 
            // Để cập nhật dữ liệu mới
            dataToWatch.Clear();

            // Make sure the command object does not already have
            // a notification object associated with it.

            sqlcmd.Notification = null;

            // Create and bind the SqlDependency object
            // to the command object.

            SqlDependency dependency = new SqlDependency(sqlcmd); // Thiết lập sự kiện trên 1 đối tượng
            dependency.OnChange += dependency_OnChange; // Lắng nghe sự thay đổi sữ liệu

            using (SqlDataAdapter adapter = new SqlDataAdapter(sqlcmd))
            {
                adapter.Fill(dataToWatch, tableName); // Fill dữ liệu về bảng giá trực tuyến thả vào trong dataset
                this.gvPriceTable.AutoGenerateColumns = false;
                this.gvPriceTable.DataSource = dataToWatch;
                this.gvPriceTable.DataMember = tableName;
            }
        }

        private void BatDau()
        {
            changeCount = 0;

            // Remove any existing dependency connection, then create a new one.
            SqlDependency.Stop(GetConnectionString());

            try
            {
                SqlDependency.Start(GetConnectionString());
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Notification", MessageBoxButtons.OK);
                return;
            }

            if (conn == null)
            {
                conn = new SqlConnection(GetConnectionString());
                conn.Open();
            }

            if (sqlcmd == null)
            {
                // GetSQL is a local procedure that returns
                // a paramaterized SQL string. You might want
                // to use a stored procedure in your application.
                sqlcmd = new SqlCommand(GetSQL(), conn);
            }

            if (dataToWatch == null)
            {
                dataToWatch = new DataSet(); //tạo cái mới để get dữ liệu về
            }

            GetData();
        }

        private void btnTrade_Click(object sender, EventArgs e)
        {
            //SqlDataReader myReader;
            string macp = cbStockId.Text.ToString().Trim();

            DateTime d = DateTime.Now;
            string ngay = d.ToString("yyyy-MM-dd HH:mm:ss");

            string loaigd = "";
            if (radBtnBuy.Checked)
            {
                loaigd = "M";
            }
            if (radBtnSell.Checked)
            {
                loaigd = "B";
            }

            string soluongmb = tbQuantity.Text.ToString().Trim();

            string giadat = tbPrice.Text.ToString().Trim();

            if (soluongmb.Length < 1 || giadat.Length < 1 || float.Parse(giadat) < 1)
            {

                MessageBox.Show("Some fields are missing!");
                return;
            }


            String strLenh = "EXEC SP_KHOPLENH_LO '" + macp + "', '" + ngay + "', '" + loaigd + "', '" + soluongmb + "', '" + giadat + "'";
            //command2 = new SqlCommand(strLenh, connection);

            SqlConnection conn = new SqlConnection(GetConnectionString());

            try
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = strLenh;
                int a = cmd.ExecuteNonQuery();

                if (a > 0)
                {
                    LoadLenhDat();
                    MessageBox.Show("Success " + a);
                }
            }
            catch
            {

            }
            finally
            {
                conn.Close();
            }

        }

        private void tbQuantity_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar) && (e.KeyChar != '.'))
            {
                e.Handled = true;
            }

            // If you want, you can allow decimal (float) numbers
            if ((e.KeyChar == '.') && ((sender as TextBox).Text.IndexOf('.') > -1))
            {
                e.Handled = true;
            }
        }

        private void tbPrice_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar) && (e.KeyChar != '.'))
            {
                e.Handled = true;
            }

            // If you want, you can allow decimal (float) numbers
            if ((e.KeyChar == '.') && ((sender as TextBox).Text.IndexOf('.') > -1))
            {
                e.Handled = true;
            }
        }

        

        void LoadLenhDat()
        {
            //gvTrade.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;

            SqlConnection conn = new SqlConnection(GetConnectionString());
            DateTime d = DateTime.Now;
            string ngay = d.ToString("yyyy-MM-dd");
            try
            {
                var dap = new SqlDataAdapter("select * from LENHDAT where CONVERT(NVARCHAR(50), NGAYDAT, 126) LIKE '" + ngay + "%'", conn);
                var table = new DataTable();

                dap.Fill(table);

                table.Columns["ID"].ColumnName = "ID";
                table.Columns["MACP"].ColumnName = "Symbol";
                table.Columns["NGAYDAT"].ColumnName = "Date";
                table.Columns["LOAIGD"].ColumnName = "Buy/Sell";
                table.Columns["LOAILENH"].ColumnName = "Type";
                table.Columns["SOLUONG"].ColumnName = "Quantity";
                table.Columns["GIADAT"].ColumnName = "Price";
                table.Columns["TRANGTHAILENH"].ColumnName = "Status";

                gvTrade.DataSource = table;

            }
            catch
            {
                MessageBox.Show("Faild to connect to Database.");
            }
            conn.Close();

        }

        private void btnReload_Click(object sender, EventArgs e)
        {
            LoadLenhDat();
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(GetConnectionString());
            conn.Open();
            Int32 selectedRowCount = gvTrade.Rows.GetRowCount(DataGridViewElementStates.Selected);
            if (selectedRowCount > 0)
            {

                try
                {

                    string uid = gvTrade.SelectedRows[0].Cells[0].Value.ToString();
                    //  MessageBox.Show(uid);
                    int cid = int.Parse(uid);
                    string sql = "DELETE FROM LENHDAT WHERE ID = " + cid + "";
                    using (SqlCommand cmd = new SqlCommand(sql, conn))
                    {

                        cmd.CommandType = CommandType.Text;
                        cmd.ExecuteNonQuery();
                        MessageBox.Show("Successfully canceled", "Info");



                    }

                }
                catch
                {
                    MessageBox.Show("Something went wrong!", "Error");
                }


            }
            conn.Close();
            LoadLenhDat();
        }

        private void btnReset_Click(object sender, EventArgs e)
        {
            //SqlConnection conn = new SqlConnection(conns);
            ResetGIATRUCTUYEN();
            MessageBox.Show("Trade session has been successfully reset.", "Info", MessageBoxButtons.OK);
        }

        void ResetGIATRUCTUYEN()
        {
            SqlConnection conn = new SqlConnection(GetConnectionString());
            conn.Open();
            SqlCommand command = new SqlCommand("EXEC SP_REFRESH_GIATRUCTUYEN", conn);
            int n = (int)command.ExecuteNonQuery();
            conn.Close();
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void FormStock_FormClosed(object sender, FormClosedEventArgs e)
        {
            SqlDependency.Stop(GetConnectionString());
            if (conn != null)
            {
                conn.Close();
            }
        }
    }
}
