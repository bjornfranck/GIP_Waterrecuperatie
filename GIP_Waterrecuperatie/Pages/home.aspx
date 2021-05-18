<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="GIP_Waterrecuperatie.home" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
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
                <a class="active" href="home.aspx">Home</a>
                <a href="level_tap_water.aspx">Leidingwater</a>
                <a href="level_rainwater.aspx">Regenwater</a>
                <a href="level_bath.aspx">Bad</a>
                <a href="consumption.aspx">Verbruik</a>
                <a href="temperature.aspx">Temperatuur</a>
                <a href="networkcamera.aspx">Camera</a>
                <a href="login.aspx">Logout</a>
            </div>
        </div>   
        <div class="main">
            <table>
                <tr>
                    <th>NIVEAU BAD</th>
                </tr>
                <tr>
                    <td>
                        <asp:Label CssClass="values" ID="lblBathLevelPrefix" runat="server" Text="[Waterlevel]"></asp:Label>
                        <asp:Label CssClass="values2" ID="lblBathLevel" runat="server" Text="0"></asp:Label>
                        <asp:Label CssClass="values2" ID="lblBathLevelSuffix" runat="server" Text="%"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label CssClass="values" ID="lblBathVolumePrefix" runat="server" Text="[Volume]"></asp:Label>
                        <asp:Label CssClass="values2" ID="lblBathVolume" runat="server" Text="0"></asp:Label>
                        <asp:Label CssClass="values2" ID="lblBathVolumeSuffix" runat="server" Text="L"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label CssClass="values" ID="lblBathMaxVolumePrefix" runat="server" Text="[Max Volume]"></asp:Label>
                        <asp:Label CssClass="values2" ID="lblBathMaxVolume" runat="server" Text="233"></asp:Label>
                        <asp:Label CssClass="values2" ID="lblBathMaxVolumeSuffix" runat="server" Text="L"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>NIVEAU:</p>
                        <div class="w3-light-grey">
                        <div class="w3-container w3-green w3-center"  id="bathLevel" style="width:0%">0%</div>
                        </div>
                    </td>
                </tr>
            </table>
            <br />
            <div class="row">
              <div class="column">
                <table>
                  <tr>
                    <th>NIVEAU REGENWATER</th>
                  </tr>
                  <tr>
                    <td>
                        <asp:Label CssClass="values" ID="lblRainLevelPrefix" runat="server" Text="[Waterlevel]"></asp:Label>
                        <asp:Label CssClass="values2" ID="lblRainLevel" runat="server" Text="0"></asp:Label>
                        <asp:Label CssClass="values2" ID="lblRainLevelSuffix" runat="server" Text="%"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label CssClass="values" ID="lblRainVolumePrefix" runat="server" Text="[Volume]"></asp:Label>
                        <asp:Label CssClass="values2" ID="lblRainVolume" runat="server" Text="0"></asp:Label>
                        <asp:Label CssClass="values2" ID="lblRainVolumeSuffix" runat="server" Text="L"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label CssClass="values" ID="lblRainMaxVolumePrefix" runat="server" Text="[Max Volume]"></asp:Label>
                        <asp:Label CssClass="values2" ID="lblRainMaxVolume" runat="server" Text="32"></asp:Label>
                        <asp:Label CssClass="values2" ID="lblRainMaxVolumeSuffix" runat="server" Text="L"></asp:Label>
                    </td>
                  </tr>
                  <tr>
                    <td>
                        <p>NIVEAU:</p>
                        <div class="w3-light-grey">
                        <div class="w3-container w3-green w3-center" id="rainLevel" style="width:0%">0%</div>
                        </div>
                    </td>
                  </tr>
                </table>
                <br />
                <table>
                  <tr>
                    <th>TEMPERATUUR</th>
                  </tr>
                  <tr>
                    <td>
                        <asp:Label CssClass="values" ID="lblTempCurrentPrefix" runat="server" Text="[Temperatuur]"></asp:Label>
                        <asp:Label CssClass="values2" ID="lblTempCurrent" runat="server" Text="0"></asp:Label>
                        <asp:Label CssClass="values2" ID="lblTempCurrentSuffix" runat="server" Text="°C"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label CssClass="values" ID="lblTempMinPrefix" runat="server" Text="[Minimum temperatuur]"></asp:Label>
                        <asp:Label CssClass="values2" ID="lblTempMin" runat="server" Text="0"></asp:Label>
                        <asp:Label CssClass="values2" ID="lblTempMinSuffix" runat="server" Text="°C"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label CssClass="values" ID="lblTempMaxPrefix" runat="server" Text="[Maximum temperatuur]"></asp:Label>
                        <asp:Label CssClass="values2" ID="lblTempMax" runat="server" Text="40"></asp:Label>
                        <asp:Label CssClass="values2" ID="lblTempMaxSuffix" runat="server" Text="°C"></asp:Label>
                    </td>
                  </tr>
                </table>
                <br />
              </div>
              <div class="column">
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
                    <th>COMPRESSOR</th>
                  </tr>
                  <tr>
                    <td>
                        <asp:Label CssClass="values" ID="lblCompressorStatePrefix" runat="server" Text="[Status]"></asp:Label>
                        <asp:Label CssClass="values2" ID="lblCompressorState" runat="server" Text="Uitgeschakeld"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label CssClass="values" ID="lblCompressorStartPrefix" runat="server" Text="[Gestart]"></asp:Label>
                        <asp:Label CssClass="values2" ID="lblCompressorStart" runat="server" Text="--:--"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label CssClass="values" ID="lblCompressorEndPrefix" runat="server" Text="[Gestopt]"></asp:Label>
                        <asp:Label CssClass="values2" ID="lblCompressorEnd" runat="server" Text="--:--"></asp:Label>
                    </td>
                  </tr>
                </table>
                  <br />
              </div>
            </div>
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
                    //error: function (XMLHttpRequest, textStatus, errorThrown) {
                    //    alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
                    //},
                    success: function (result) {
                        var values = result['d'].split("#");
                        setValue("rainLevel", values[0]);
                        setValue("tapLevel", values[1]);
                        setValue("bathLevel", values[2]);
                        
                        setValue2("lblRainLevel", values[0]);
                        setValue2("lblTapLevel", values[1]);
                        setValue2("lblBathLevel", values[2]);
                        setValue2("lblTempCurrent", values[3]);
                        setValue2("lblConsumption", values[4]);
                        setValue2("lblRainVolume", values[6]);
                        setValue2("lblTapVolume", values[7]);
                        setValue2("lblBathVolume", values[8]);
                        setValue2("lblCompressorState", values[5]);
                        setValue2("lblCompressorStart", values[9]);
                        setValue2("lblCompressorEnd", values[10]);
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

                var time = " [Tijd] " +  h + ":" + m + ":" + s;
                document.getElementById("Clock").innerText = time;
                document.getElementById("Clock").textContent = time;

                setTimeout(showTime, 1000);
            }
            showTime();

            function showDate() {
                var today = new Date();

                var date = " [Datum] " +  today.getDate() + '/' + (today.getMonth() + 1) + '/' + today.getFullYear();

                document.getElementById("Date").innerHTML = date;
            }
            showDate();
        </script>
    </form>   
</body>
</html>
