<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="GIP_Waterrecuperatie.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link rel="icon" href="\Sources\Images\Icon.ico"/>
    <link rel="stylesheet" href="\Sources\CSS\login.css" />
</head>
    <body>
        <div class="login">
            <form id="form1" runat="server">
            <h1><asp:Image ID="imgLogo" runat="server" ImageUrl="\Sources\Images\Logo.png" height="200" Width="200"/></h1>
	        <h1>Login</h1>
                <asp:TextBox CssClass="tbUsername" ID="tbUsername" runat="server" placeholder="Gebruikersnaam" AutoCompleteType="Disabled"></asp:TextBox>
                <asp:TextBox CssClass="tbPassword" ID="tbPassword" runat="server" placeholder="Wachtwoord" AutoCompleteType="Disabled" TextMode="Password"></asp:TextBox>
                <asp:Button CssClass="btnLogin" ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click"/>
                <asp:Label ID="lblResponse" runat="server" CssClass="lblResponse" ForeColor="#CC0000"></asp:Label>
            </form>
        </div>
    </body>
</html>
