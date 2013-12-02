<%@ Page Title="Add a new book" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddBook.aspx.cs" Inherits="Booker.AddBook" Theme="Theme1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="LabelStatus" runat="server" Text=""></asp:Label><br/>
    <asp:Label ID="lTitle" runat="server" Text="Title"></asp:Label><br/>
    <asp:TextBox ID="tbTitle" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
            ControlToValidate="tbTitle"
            Text="* Title is required."
            SetFocusOnError="true"
            Display="Dynamic"/><br/>
    <asp:Label ID="lAuthor" runat="server" Text="Author"></asp:Label><br/>
    <asp:DropDownList ID="AuthorList" runat="server" DataSourceID="SqlDataSource1" DataTextField="FullName" DataValueField="Id">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BookerContext %>" SelectCommand="SELECT Authors.Id, Authors.Name + ' ' + Authors.Surname AS FullName FROM Authors"></asp:SqlDataSource>
    <br/>
    <asp:Label ID="lYear" runat="server" Text="Year"></asp:Label><br/>
    <asp:TextBox ID="tbYear" runat="server"></asp:TextBox>
    <asp:RangeValidator ID="RangeValidator" runat="server"
            ControlToValidate="tbYear"
            Text="* Year (from 1700 to 2013)."
            MinimumValue="1700"
            MaximumValue="2013"
            SetFocusOnError="true"
            Display="Dynamic"/><br/>
    <asp:Button ID="Button1" runat="server" Text="Add" OnClick="Button1_Click" />
</asp:Content>
