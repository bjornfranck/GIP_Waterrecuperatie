<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="consumption.aspx.cs" Inherits="GIP_Waterrecuperatie.debietmeting" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Verbruik</title>
    <link rel="icon" href="\Sources\Images\Icon.ico"/>
    <link rel="stylesheet" href="\Sources\CSS\main.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
    <script src="https://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
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
                <a class="active" href="consumption.aspx">Verbruik</a>
                <a href="temperature.aspx">Temperatuur</a>
                <a href="networkcamera.aspx">Camera</a>
                <a href="login.aspx">Logout</a>
            </div>
        </div>
        <br />
        <div class="main">
            <table>
                <tr>
                    <th>VERBRUIK</th>
                </tr>
                <tr>
                    <td>
                        <asp:Label CssClass="values" ID="lblConsumptionPrefix" runat="server" Text="[Verbruik]"></asp:Label>
                        <asp:Label CssClass="values2" ID="lblConsumption" runat="server" Text="0"></asp:Label>
                        <asp:Label CssClass="values2" ID="lblConsumptionSuffix" runat="server" Text="L"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div id="Date" onload="showDate()"></div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div id="Clock" onload="showTime()"></div>
                    </td>
                </tr>
            </table>
            <br />
            <table>
                <tr>
                    <th>GRAFIEK VERBRUIK</th>
                </tr> 
                <tr>
                    <td>
                        <asp:Chart ID="chartConsumption" runat="server" DataSourceID="databaseWaterrecuperatie" Height="500px" Width="800px" ImageLocation="~/Sources/Images/Charts.png" ImageStorageMode="UseImageLocation" BackColor="Transparent" BorderlineColor="Transparent">
                            <series>
                                <asp:Series Name="Waterverbruik (L)" XValueMember="Tijd" YValueMembers="Verbruik" IsValueShownAsLabel="True" Legend="legendConsumption" ChartArea="chartAreaConsumption">
                                </asp:Series>
                            </series>
                            <chartareas>
                                <asp:ChartArea Name="chartAreaConsumption">
                                </asp:ChartArea>
                            </chartareas>
                            <Legends>
                                <asp:Legend Name="legendConsumption" Title="Legende">
                                </asp:Legend>
                            </Legends>
                            <BorderSkin PageColor="Transparent" />
                        </asp:Chart>
                        <asp:SqlDataSource ID="databaseWaterrecuperatie" runat="server" ConnectionString="<%$ ConnectionStrings:databaseWaterrecuperatie %>" ProviderName="<%$ ConnectionStrings:databaseWaterrecuperatie.ProviderName %>" SelectCommand="SELECT TOP 10 * FROM debietmeting ORDER BY Id DESC"></asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="footer">
            <p>GIP Waterrecuperatie | Gitok bovenbouw 2020-2021 | Owen Nolis - Yenthe van Den Eynden - Björn Franck</p>
        </div>
        <script>
            let myVar = setInterval(dataLoad, 5000);

            function dataLoad() {
                $.ajax({
                    type: "POST",
                    url: "home.aspx/LoadData",
                    data: JSON.stringify({ name: "all" }),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    success: function (result) {
                        var values = result['d'].split("#");
                        setValue2("lblConsumption", values[4]);
                    }
                });
            }
            function setValue(id, value) {
                document.getElementById(id).innerHTML = value + "%";
                document.getElementById(id).style.width = value + "%";
            }
            function setValue2(id, value) {
                document.getElementById(id).textContent = value;
            }

            function showTime() {
                var date = new Date();
                var h = date.getHours();
                var m = date.getMinutes();
                var s = date.getSeconds();

                h = (h < 10) ? "0" + h : h;
                m = (m < 10) ? "0" + m : m;
                s = (s < 10) ? "0" + s : s;

                var time = "[Tijd] " + h + ":" + m + ":" + s;
                document.getElementById("Clock").innerText = time;
                document.getElementById("Clock").textContent = time;

                setTimeout(showTime, 1000);
            }
            showTime();

            function showDate() {
                var today = new Date();

                var date = "[Datum] " + today.getDate() + '/' + (today.getMonth() + 1) + '/' + today.getFullYear();

                document.getElementById("Date").innerHTML = date;
            }
            showDate();
        </script>
    </form>
</body>
</html>
