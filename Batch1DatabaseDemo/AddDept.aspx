<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddDept.aspx.cs" Inherits="AddDept" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="form-horizontal">
        <div class="form-group">
            <label class="control-label col-sm-4">Department Name</label>
            <div class="col-sm-8">
                <asp:textbox id="DepartmentName" runat="server" cssclass="form-control"></asp:textbox>
                <asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server" controltovalidate="DepartmentName" cssclass="req" display="Dynamic" errormessage="Department Name is must"></asp:requiredfieldvalidator>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-4">Location</label>
            <div class="col-sm-8">
                <asp:radiobuttonlist id="Location" runat="server" repeatdirection="Horizontal">
                    <asp:ListItem Selected="True">North</asp:ListItem>
                    <asp:ListItem>East</asp:ListItem>
                    <asp:ListItem>West</asp:ListItem>
                    <asp:ListItem>South</asp:ListItem>
                </asp:radiobuttonlist>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-4">Incharge Name</label>
            <div class="col-sm-8">
                <asp:textbox id="InchargeName" runat="server" cssclass="form-control"></asp:textbox>
                <asp:requiredfieldvalidator id="RequiredFieldValidator2" runat="server" controltovalidate="InchargeName" cssclass="req" display="Dynamic" errormessage="Incharge Name is must"></asp:requiredfieldvalidator>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-4 col-sm-8">
                <asp:label id="Msg" runat="server"></asp:label>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-4 col-sm-8">
                <asp:button id="Button1" runat="server" cssclass="btn btn-primary" text="Add Department" OnClick="Button1_Click" />
                <asp:SqlDataSource ID="SqlDataSourceDept" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" DeleteCommand="DELETE FROM [department] WHERE [DepartmentName] = @DepartmentName" InsertCommand="INSERT INTO [department] ([DepartmentName], [Location], [InchargeName]) VALUES (@DepartmentName, @Location, @InchargeName)" SelectCommand="SELECT * FROM [department]" UpdateCommand="UPDATE [department] SET [Location] = @Location, [InchargeName] = @InchargeName WHERE [DepartmentName] = @DepartmentName">
                    <DeleteParameters>
                        <asp:Parameter Name="DepartmentName" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="DepartmentName" Name="DepartmentName" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="Location" Name="Location" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="InchargeName" Name="InchargeName" PropertyName="Text" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Location" Type="String" />
                        <asp:Parameter Name="InchargeName" Type="String" />
                        <asp:Parameter Name="DepartmentName" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
    
</asp:Content>

