using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddEmp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        DataView dv = SqlDataSourceEmployee.Select(DataSourceSelectArguments.Empty) as DataView;

        bool Exists = false;

        if(dv != null)
        {
            for (int i = 0; i < dv.Table.Rows.Count; i++)
            {
                if(PhoneNo.Text == dv.Table.Rows[i]["PhoneNo"].ToString())
                {
                    Exists = true;
                }
            }
        }

        if(Exists)
        {
            Msg.Text = "Duplicate Phone No";
            Msg.CssClass = "text-danger";
        }
        else
        {
            SqlDataSourceEmployee.Insert();
            Msg.Text = "Employee Added";
            Msg.CssClass = "text-success";
        }
    }
}