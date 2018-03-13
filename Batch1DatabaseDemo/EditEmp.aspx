<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditEmp.aspx.cs" Inherits="EditEmp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="form-horizontal">
        <div class="form-group">
            <label class="control-label col-sm-4">Employee Name</label>
            <div class="col-sm-8">

                <asp:TextBox ID="EmpName" runat="server" CssClass="form-control"></asp:TextBox>

            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-4">Salary</label><div class="col-sm-8">

                <asp:TextBox ID="Salary" runat="server" CssClass="form-control"></asp:TextBox>

            </div>
        </div>
         <div class="form-group">
            <label class="control-label col-sm-4">Phone No</label><div class="col-sm-8">

                <asp:TextBox ID="PhoneNo" runat="server" CssClass="form-control"></asp:TextBox>

            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-4">Department Name</label><div class="col-sm-8">

                <asp:DropDownList ID="DepartmentName" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceDept" DataTextField="DepartmentName" DataValueField="DepartmentName">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSourceDept" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT * FROM [department]"></asp:SqlDataSource>

            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-4 col-sm-8">

               

                <asp:Label ID="Msg" runat="server"></asp:Label>

               

            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-4 col-sm-8">

                <asp:Button ID="Button1" runat="server" Text="Update" CssClass="btn btn-success" OnClick="Button1_Click" />

                <asp:Button ID="Button2" runat="server" CssClass="btn btn-danger" OnClick="Button2_Click" Text="Delete" />

                <asp:SqlDataSource ID="SqlDataSourceEmployee" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" DeleteCommand="DELETE FROM [employee] WHERE [EmpId] = @EmpId" InsertCommand="INSERT INTO [employee] ([EmpName], [Salary], [PhoneNo], [DepartmentName]) VALUES (@EmpName, @Salary, @PhoneNo, @DepartmentName)" SelectCommand="SELECT * FROM [employee]" UpdateCommand="UPDATE [employee] SET [EmpName] = @EmpName, [Salary] = @Salary, [PhoneNo] = @PhoneNo, [DepartmentName] = @DepartmentName WHERE [EmpId] = @EmpId">
                    <DeleteParameters>
                        <asp:QueryStringParameter Name="EmpId" QueryStringField="id" Type="Decimal" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="EmpName" Name="EmpName" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="Salary" Name="Salary" PropertyName="Text" Type="Decimal" />
                        <asp:ControlParameter ControlID="PhoneNo" Name="PhoneNo" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="DepartmentName" Name="DepartmentName" PropertyName="Text" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="EmpName" Name="EmpName" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="Salary" Name="Salary" PropertyName="Text" Type="Decimal" />
                        <asp:ControlParameter ControlID="PhoneNo" Name="PhoneNo" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="DepartmentName" Name="DepartmentName" PropertyName="SelectedValue" Type="String" />
                        <asp:QueryStringParameter Name="EmpId" QueryStringField="id" Type="Decimal" />
                    </UpdateParameters>
                </asp:SqlDataSource>

            </div>
        </div>
    </div>
</asp:Content>

