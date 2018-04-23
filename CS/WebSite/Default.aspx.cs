using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxGridView;

public partial class _Default : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {
    }
    protected void detailGrid_BeforePerformDataSelect(object sender, EventArgs e) {
        Session["CategoryID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
    }
    protected void masterGrid_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e) {
        if((int)e.GetValue("ProductCount") == 0) {
            e.Row.BackColor = Color.LightBlue;
        }
    }
}