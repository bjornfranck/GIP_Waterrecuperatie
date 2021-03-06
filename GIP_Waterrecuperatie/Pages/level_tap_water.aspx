<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="level_tap_water.aspx.cs" Inherits="GIP_Waterrecuperatie.niveaumetingen_leidingwater" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Leidingwater</title>
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
                <a class="active" href="level_tap_water.aspx">Leidingwater</a>
                <a href="level_rainwater.aspx">Regenwater</a>
                <a href="level_bath.aspx">Bad</a>
                <a href="consumption.aspx">Verbruik</a>
                <a href="temperature.aspx">Temperatuur</a>
                <a href="networkcamera.aspx">Camera</a>
                <a href="login.aspx">Logout</a>
            </div>
        </div>
        <br />
        <div class="main">
            <table>
                  <tr>
                    <th>NIVEAU LEIDINGWATER</th>
                  </tr>
                  <tr>
                    <td>
                        <asp:Label CssClass="values" ID="lblTapLevelPrefix" runat="server" Text="[Waterlevel]"></asp:Label>
                        <asp:Label CssClass="values2" ID="lblTapLevel" runat="server" Text="0"></asp:Label>
                        <asp:Label CssClass="values2" ID="lblTapLevelSuffix" runat="server" Text="%"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label CssClass="values" ID="lblTapVolumePrefix" runat="server" Text="[Volume]"></asp:Label>
                        <asp:Label CssClass="values2" ID="lblTapVolume" runat="server" Text="0"></asp:Label>
                        <asp:Label CssClass="values2" ID="lblTapVolumeSuffix" runat="server" Text="L"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label CssClass="values" ID="lblTapMaxVolumePrefix" runat="server" Text="[Max Volume]"></asp:Label>
                        <asp:Label CssClass="values2" ID="lblTapMaxVolume" runat="server" Text="176"></asp:Label>
                        <asp:Label CssClass="values2" ID="lblTapMaxVolumeSuffix" runat="server" Text="L"></asp:Label>
                    </td>
                  </tr>
                  <tr>
                    <td>
                        <p>NIVEAU:</p>
                        <div class="w3-light-grey">
                        <div class="w3-container w3-green w3-center" id="tapLevel" style="width:0%">0%</div>
                        </div>
                    </td>
                  </tr>
                </table>
            <br />
            <table>
                <tr>
                    <th>GRAFIEK NIVEAU LEDINGWATER OPSLAGTANK</th>
                </tr> 
                <tr>
                    <td>
                        <asp:Chart ID="chartTap" runat="server" DataSourceID="databaseWaterrecuperatie" Height="500px" Width="800px" ImageLocation="~/Sources/Images/Charts.png" ImageStorageMode="UseImageLocation" BackColor="Transparent" BorderlineColor="Transparent">
                            <series>
                                <asp:Series Name="Leidingwater (L)" XValueMember="Tijd" YValueMembers="Volume" IsValueShownAsLabel="True" Legend="legendTap" ChartArea="chartAreaTap">
                                </asp:Series>
                            </series>
                            <chartareas>
                                <asp:ChartArea Name="chartAreaTap">
                                </asp:ChartArea>
                            </chartareas>
                            <Legends>
                                <asp:Legend Name="legendTap" Title="Legende">
                                </asp:Legend>
                            </Legends>
                            <BorderSkin PageColor="Transparent" />
                        </asp:Chart>
                        <asp:SqlDataSource ID="databaseWaterrecuperatie" runat="server" ConnectionString="<%$ ConnectionStrings:databaseWaterrecuperatie %>" ProviderName="<%$ ConnectionStrings:databaseWaterrecuperatie.ProviderName %>" SelectCommand="SELECT TOP 10 * FROM niveaumetingen_leidingwater ORDER BY Id DESC"></asp:SqlDataSource>
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
                        setValue("tapLevel", values[1]);
                        setValue2("lblTapLevel", values[1]);
                        setValue2("lblTapVolume", values[7]);
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
        </script>
    </form>
</body>
</html>
