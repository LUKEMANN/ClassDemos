using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditEmp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] == null)
        {
            Response.Redirect("ViewEmp.aspx");
        }

        if (!IsPostBack)
        {
            DataView dv = SqlDataSourceEmployee.Select(DataSourceSelectArguments.Empty) as DataView;

            if (dv != null)
            {
                for (int i = 0; i < dv.Table.Rows.Count; i++)
                {
                    if (Request.QueryString["id"] == dv.Table.Rows[i]["EmpId"].ToString())
                    {
                        EmpName.Text = dv.Table.Rows[i]["EmpName"].ToString();
                        Salary.Text = dv.Table.Rows[i]["Salary"].ToString();
                        PhoneNo.Text = dv.Table.Rows[i]["PhoneNo"].ToString();
                        DepartmentName.SelectedValue = dv.Table.Rows[i]["DepartmentName"].ToString();
                        break;
                    }
                }
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataSourceEmployee.Update();
        Response.Redirect("ViewEmp.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlDataSourceEmployee.Delete();
        Response.Redirect("ViewEmp.aspx");
    }
}