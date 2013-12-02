<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Booker._Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <asp:ObjectDataSource ID="ThemeDataSource" runat="server" 
     SelectMethod="GetThemes" TypeName="Booker.App_Code.ThemeManager" ></asp:ObjectDataSource>
    <asp:RadioButtonList ID="strTheme" runat="server" DataTextField=name 
     DataValueField=name OnSelectedIndexChanged="strTheme_SelectedIndexChanged" 
     OnDataBound="strTheme_DataBound" DataSourceID="ThemeDataSource" 
     AutoPostBack=true RepeatDirection=Horizontal />
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <asp:ListView ID="ListView1" runat="server" DataSourceID="DB">
        <AlternatingItemTemplate>
            <tr style="width:100%;">
                <td style="width:25%;">
                    <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                </td>
                <td style="width:25%;">
                    <asp:Label ID="YearLabel" runat="server" Text='<%# Eval("Year") %>' />
                </td>
                <td style="width:25%;">
                    <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                </td>
                <td style="width:25%;">
                    <asp:Label ID="SurnameLabel" runat="server" Text='<%# Eval("Surname") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </td>
                <td>
                    <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                </td>
                <td>
                    <asp:TextBox ID="YearTextBox" runat="server" Text='<%# Bind("Year") %>' />
                </td>
                <td>
                    <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                </td>
                <td>
                    <asp:TextBox ID="SurnameTextBox" runat="server" Text='<%# Bind("Surname") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table id="Table1" runat="server" style="">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </td>
                <td>
                    <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                </td>
                <td>
                    <asp:TextBox ID="YearTextBox" runat="server" Text='<%# Bind("Year") %>' />
                </td>
                <td>
                    <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                </td>
                <td>
                    <asp:TextBox ID="SurnameTextBox" runat="server" Text='<%# Bind("Surname") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="">
                <td style="font-weight:bold; width:40%">
                    <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                </td>
                <td style="width:10%">
                    <asp:Label ID="YearLabel" runat="server" Text='<%# Eval("Year") %>' />
                </td>
                <td style="width:25%">
                    <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                </td>
                <td style="width:25%">
                    <asp:Label ID="SurnameLabel" runat="server" Text='<%# Eval("Surname") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table id="Table2" runat="server" style="width: 100%;">
                <tr id="Tr1" runat="server">
                    <td id="Td1" runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                            <tr id="Tr2" runat="server" style="">
                                <th id="Th1" runat="server">Title</th>
                                <th id="Th2" runat="server">Year</th>
                                <th id="Th3" runat="server">Name</th>
                                <th id="Th4" runat="server">Surname</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="Tr3" runat="server">
                    <td id="Td2" runat="server" style="">
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                </td>
                <td>
                    <asp:Label ID="YearLabel" runat="server" Text='<%# Eval("Year") %>' />
                </td>
                <td>
                    <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                </td>
                <td>
                    <asp:Label ID="SurnameLabel" runat="server" Text='<%# Eval("Surname") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="DB" runat="server" ConnectionString="<%$ ConnectionStrings:BookerContext %>" SelectCommand="SELECT Books.Title, Books.Year, Authors.Name, Authors.Surname FROM Books INNER JOIN Authors ON Books.AuthorId = Authors.Id ORDER BY Books.Title"></asp:SqlDataSource>
</asp:Content>
