<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewDept.aspx.cs" Inherits="ViewDept" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="table-responsive">

        <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover" AutoGenerateColumns="False" DataKeyNames="DepartmentName" DataSourceID="SqlDataSourceDept">
            <Columns>
                <asp:BoundField DataField="DepartmentName" HeaderText="DepartmentName" ReadOnly="True" SortExpression="DepartmentName" />
                <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" />
                <asp:BoundField DataField="InchargeName" HeaderText="InchargeName" SortExpression="InchargeName" />
                <asp:HyperLinkField DataNavigateUrlFields="DepartmentName" DataNavigateUrlFormatString="EditDept.aspx?dn={0}" HeaderText="Edit" Text="Edit/Delete" />
            </Columns>
            <EmptyDataTemplate>
                No Data Found.
            </EmptyDataTemplate>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSourceDept" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" DeleteCommand="DELETE FROM [department] WHERE [DepartmentName] = @DepartmentName" InsertCommand="INSERT INTO [department] ([DepartmentName], [Location], [InchargeName]) VALUES (@DepartmentName, @Location, @InchargeName)" SelectCommand="SELECT * FROM [department]" UpdateCommand="UPDATE [department] SET [Location] = @Location, [InchargeName] = @InchargeName WHERE [DepartmentName] = @DepartmentName">
            <DeleteParameters>
                <asp:Parameter Name="DepartmentName" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="DepartmentName" Type="String" />
                <asp:Parameter Name="Location" Type="String" />
                <asp:Parameter Name="InchargeName" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Location" Type="String" />
                <asp:Parameter Name="InchargeName" Type="String" />
                <asp:Parameter Name="DepartmentName" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </div>
</asp:Content>

