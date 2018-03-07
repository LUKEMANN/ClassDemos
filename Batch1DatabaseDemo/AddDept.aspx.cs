using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddDept : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        DataView dv = SqlDataSourceDept.Select(DataSourceSelectArguments.Empty) as DataView;

        bool Exists = false;

        if (dv != null)
        {
            for (int i = 0; i < dv.Table.Rows.Count; i++)
            {
                if (DepartmentName.Text == dv.Table.Rows[i]["DepartmentName"].ToString())
                {
                    Exists = true;
                    break;
                }
            }
        }


        if (Exists)
        {
            Msg.Text = "Department already exists";
            Msg.CssClass = "text-danger";
        }
        else
        {
            SqlDataSourceDept.Insert();
            Msg.Text = "Department added";
            Msg.CssClass = "text-success";
        }
    }
}