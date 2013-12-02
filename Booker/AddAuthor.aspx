<%@ Page Title="Add an author" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddAuthor.aspx.cs" Inherits="Booker.AddAuthor" Theme="Theme2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="LabelStatus" runat="server" Text=""></asp:Label><br/>
    <asp:Label ID="LbName" runat="server">Name</asp:Label><br />
    <asp:TextBox ID="Name" runat="server"/>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                ControlToValidate="Name"
                                Text="* Name is required."
                                SetFocusOnError="true"
                                Display="Dynamic"/>
    <br />
    <asp:Label ID="LbSurname" runat="server">Surname</asp:Label><br />
    <asp:TextBox ID="Surname" runat="server"/>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
        ControlToValidate="Surname"
        Text="* Surname is required."
        SetFocusOnError="true"
        Display="Dynamic"/>
    <br />
    <asp:Button ID="Button1" runat="server" Text="Add" OnClick="Button1_Click" />
</asp:Content>
