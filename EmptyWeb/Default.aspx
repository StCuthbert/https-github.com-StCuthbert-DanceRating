<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EmptyWeb.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>Рейтинг</title>
    <link rel="stylesheet" href="NewStyles.css" />
</head>
<body>
<form id="form1" runat="server">
<div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" ProviderName="<%$ ConnectionStrings:conn.ProviderName %>"
        SelectCommand="SELECT dnum, name, rating FROM dance ORDER BY rating DESC">
    </asp:SqlDataSource>


    <h1 align="center">
        &nbsp;</h1>
    <h1 align="center">
    Рейтинг танцоров
        &nbsp;</h1>
    <p align="center">
        &nbsp;</p>




    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width= "65%" OnSorted="GridView1_Sorted" >

        <Columns>
            <asp:BoundField  HeaderText="Позиция в рейтинге" ItemStyle-Width="5%"/>
            <asp:BoundField  DataField="dnum" HeaderText="Личный номер" SortExpression="dnum" ItemStyle-Width="5%" />
            <asp:BoundField  DataField="name" HeaderText="Ф.И.О." SortExpression="name" ItemStyle-Width="60%" />
            <asp:BoundField  DataField="rating" HeaderText="Очки" SortExpression="rating" ItemStyle-Width="25%" />
            
        </Columns>

    </asp:GridView>

</div>
</form>
</body>
</html>

