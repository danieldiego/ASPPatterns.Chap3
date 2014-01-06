<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ASPPatterns.Chap3.SmartUI.Web._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        Display prices with         
        <asp:DropDownList ID="ddlDiscountType" runat="server" AutoPostBack="True" onselectedindexchanged="ddlDiscountType_SelectedIndexChanged">            
            <asp:ListItem Value="0">No Discount</asp:ListItem>
            <asp:ListItem Value="1">Trade Discount</asp:ListItem>        
        </asp:DropDownList>

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductId" DataSourceID="SqlDataSource1" EmptyDataText="No hay registros de datos para mostrar." OnRowDataBound="GridView1_RowDataBound">
            <Columns>
                <asp:BoundField DataField="ProductId" HeaderText="ProductId" ReadOnly="True" SortExpression="ProductId" />
                <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
                <asp:BoundField DataField="RRP" HeaderText="RRP" SortExpression="RRP" />
                <asp:BoundField DataField="SellingPrice" HeaderText="SellingPrice" SortExpression="SellingPrice" />
<%--                <asp:TemplateField HeaderText="SellingPrice" SortExpression="SellingPrices">
                    <ItemTemplate>
                        <asp:Label ID="lblSellingPrice" runat="server" Text='<%# Bind("sellingPrice") %>'></asp:Label>                   
                    </ItemTemplate>                                    
                </asp:TemplateField>--%>
                <asp:TemplateField HeaderText="Discount">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblDiscount"></asp:Label>                    
                    </ItemTemplate>                 
                </asp:TemplateField>                
                <asp:TemplateField HeaderText="Savings">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblSavings"></asp:Label>                    
                    </ItemTemplate>                
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ShopConnectionString1 %>" DeleteCommand="DELETE FROM [Products] WHERE [ProductId] = @ProductId" InsertCommand="INSERT INTO [Products] ([ProductName], [RRP], [SellingPrice]) VALUES (@ProductName, @RRP, @SellingPrice)" ProviderName="<%$ ConnectionStrings:ShopConnectionString1.ProviderName %>" SelectCommand="SELECT [ProductId], [ProductName], [RRP], [SellingPrice] FROM [Products]" UpdateCommand="UPDATE [Products] SET [ProductName] = @ProductName, [RRP] = @RRP, [SellingPrice] = @SellingPrice WHERE [ProductId] = @ProductId">
            <DeleteParameters>
                <asp:Parameter Name="ProductId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ProductName" Type="String" />
                <asp:Parameter Name="RRP" Type="Decimal" />
                <asp:Parameter Name="SellingPrice" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ProductName" Type="String" />
                <asp:Parameter Name="RRP" Type="Decimal" />
                <asp:Parameter Name="SellingPrice" Type="Decimal" />
                <asp:Parameter Name="ProductId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Getting started</h2>
            <p>
                ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Get more libraries</h2>
            <p>
                NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Web Hosting</h2>
            <p>
                You can easily find a web hosting company that offers the right mix of features and price for your applications.
            </p>
            <p>
                <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
