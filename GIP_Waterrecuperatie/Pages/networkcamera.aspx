<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="networkcamera.aspx.cs" Inherits="GIP_Waterrecuperatie.networkcamera" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Verbruik</title>
    <link rel="icon" href="\Sources\Images\Icon.ico"/>
    <link rel="stylesheet" href="\Sources\CSS\main.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <a href="home.aspx" class="logo"><asp:Image ID="imgLogo" runat="server" ImageUrl="\Sources\Images\Logo.png" height="50" Width="50"/></a>
            <a href="home.aspx" class="logo">GIP Waterrecuperatie</a>
            <div class="header-right">
                <a href="home.aspx">Home</a>
                <a href="level_tap_water.aspx">Leidingwater</a>
                <a href="level_rainwater.aspx">Regenwater</a>
                <a href="level_bath.aspx">Bad</a>
                <a href="consumption.aspx">Verbruik</a>
                <a href="temperature.aspx">Temperatuur</a>
                <a class="active" href="networkcamera.aspx">Camera</a>
                <a href="login.aspx">Logout</a>
            </div>
        </div>
        <br />
        <div class="main">
            <table>
                  <tr>
                    <td>
                        <asp:Button ID="btnCamera" runat="server" Text="Camera" OnClick="btnCamera_Click" />
                        <iframe width="640" height="640" src ="https://192.168.1.8/videostream.cgi?user=admin&pwd=" style="border:none;"/>
                    </td>
                  </tr>
            </table>
        </div>
        <br />
        <div class="footer">
            <p>GIP Waterrecuperatie | Gitok bovenbouw 2020-2021 | Owen Nolis - Yenthe van Den Eynden - Björn Franck</p>
        </div>
    </form>
</body>
</html>
                        
