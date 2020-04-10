<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataEnter.aspx.cs" Inherits="EmptyWeb.DataEnter" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Ввод данных</title>
</head>
<body>
    <form id="form1" runat="server">
        
        <h1>Ввод данных в базу конкурсов</h1>
        <div>
            <asp:Label ID="Label1" runat="server" Text="Название конкурса:"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox1" runat="server" Height="16px" style="margin-left: 18px" Width="796px"></asp:TextBox>
            <br />
            <br />
        </div>
        <asp:Label ID="Label2" runat="server" Text="Занятое место:"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox2" runat="server" style="margin-left: 49px" Width="99px"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Количество очков:"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox3" runat="server" style="margin-left: 21px" Width="99px"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Text="Персональный номер танцора:"></asp:Label>
        &nbsp;
        <asp:TextBox ID="TextBox4" runat="server" style="margin-left: 18px" Width="99px"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Добавить" OnClick="Button1_Click" />
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" ProviderName="<%$ ConnectionStrings:conn.ProviderName %>" SelectCommand="SELECT * FROM competition" DeleteCommand="DELETE FROM competition WHERE id = ?" InsertCommand="INSERT INTO competition (id, title, place, score, dancer_num) VALUES (?, ?, ?, ?, ?)" UpdateCommand="UPDATE competition SET title = ?, place = ?, score = ?, dancer_num = ? WHERE id = ?">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="id" Type="Int32" />
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="place" Type="Int32" />
                <asp:Parameter Name="score" Type="Int32" />
                <asp:Parameter Name="dancer_num" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="place" Type="Int32" />
                <asp:Parameter Name="score" Type="Int32" />
                <asp:Parameter Name="dancer_num" Type="Int32" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="id">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="title" HeaderText="Название конкурса" SortExpression="title" />
                <asp:BoundField DataField="place" HeaderText="Занятное место" SortExpression="place" />
                <asp:BoundField DataField="score" HeaderText="Очки" SortExpression="score" />
                <asp:BoundField DataField="dancer_num" HeaderText="Номер танцора" SortExpression="dancer_num" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
        </asp:GridView>
        <br />
        <br />
        <br />

        <h1>Ввод данных в базу танцоров:</h1>
        <asp:Label ID="Label5" runat="server" Text="Персональный номер танцора:"></asp:Label>
&nbsp;&nbsp; &nbsp;&nbsp;
        <asp:TextBox ID="TextBox5" runat="server" Height="16px"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label6" runat="server" Text="Ф.И.О. танцора:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;
        <asp:TextBox ID="TextBox6" runat="server" Width="796px" Height="16px"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" Text="Добавить" OnClick="Button2_Click" />
        <br />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" ProviderName="<%$ ConnectionStrings:conn.ProviderName %>" SelectCommand="SELECT * FROM dance" DeleteCommand="DELETE FROM dance WHERE id = ?" InsertCommand="INSERT INTO dance (id, dnum, name, rating) VALUES (?, ?, ?, ?)" UpdateCommand="UPDATE dance SET dnum = ?, name = ?, rating = ? WHERE id = ?">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="id" Type="Int32" />
                <asp:Parameter Name="dnum" Type="Int32" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="rating" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="dnum" Type="Int32" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="rating" Type="Int32" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" DataKeyNames="id">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="dnum" HeaderText="Номер танцора" SortExpression="dnum" />
                <asp:BoundField DataField="name" HeaderText="Ф.И.О." SortExpression="name" />
                <asp:BoundField DataField="rating" HeaderText="Очки рейтинга" SortExpression="rating" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
        <br />
    </form>
</body>
</html>
