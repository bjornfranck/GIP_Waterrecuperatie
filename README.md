Stappen voor een werkende website:
-----------------------------------------------------------------------------------------------------
1 - Verander in Pages/Classes/Variables.cs de connection string en filepath string naar de juiste.
    (Database is te vinden bij GIP_Waterrecuperatie/Gip_Waterrecuperatie/Sources)
-----------------------------------------------------------------------------------------------------
2 - Ga dan naar Web.config en verander daar de connectionstring.

    In dit stukje code kan de connectionstring gevonden worden (Staat normaal bovenaan Web.config):

    <connectionStrings>
    <add name="databaseWaterrecuperatie" connectionString="Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\Users\franc_au7kam8\Desktop\GIP_Waterrecuperatie\GIP_Waterrecuperatie\Sources\database_waterrecuperatie.accdb; Jet OLEDB:Database Password = Water;"
      providerName="System.Data.OleDb" />
    </connectionStrings>
-----------------------------------------------------------------------------------------------------
3 - Start het programma. Alles zou moeten werken als de bovenstaande stappen correct zijn gevolgd.
-----------------------------------------------------------------------------------------------------
Gitok Kalmthout | Owen Nolis, Yenthe Van den Eynden en Björn Franck | GIP 2020 - 2021
