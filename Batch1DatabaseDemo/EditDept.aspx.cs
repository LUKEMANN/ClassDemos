using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditDept : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Request.QueryString["dn"] == null)
        {
            Response.Redirect("ViewDept.aspx");
        }

        if(!IsPostBack)
        {
            DataView dv = SqlDataSourceDept.Select(DataSourceSelectArguments.Empty) as DataView;

            if(dv != null)
            {
                for (int i = 0; i < dv.Table.Rows.Count; i++)
                {
                    if(Request.QueryString["dn"] == dv.Table.Rows[i]["DepartmentName"].ToString())
                    {
                        DepartmentName.Text = dv.Table.Rows[i]["DepartmentName"].ToString();
                        Location.SelectedValue = dv.Table.Rows[i]["Location"].ToString();
                        InchargeName.Text = dv.Table.Rows[i]["InchargeName"].ToString();
                        break;
                    }
                }
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataSourceDept.Update();
        Response.Redirect("ViewDept.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlDataSourceDept.Delete();
        Response.Redirect("ViewDept.aspx");
    }
}