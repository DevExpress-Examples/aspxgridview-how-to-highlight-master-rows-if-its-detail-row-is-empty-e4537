<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title> How to highlight master rows if its detail row is empty</title>
</head>
<body>
	<form id="form1" runat="server">
		<div>
			<dx:ASPxGridView ID="masterGrid" runat="server" DataSourceID="Categories" KeyFieldName="CategoryID" OnHtmlRowPrepared="masterGrid_HtmlRowPrepared" AutoGenerateColumns="false">
				<Columns>
					<dx:GridViewDataTextColumn FieldName="CategoryID"></dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="CategoryName"></dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="Description"></dx:GridViewDataTextColumn>
					<dx:GridViewDataTextColumn FieldName="ProductCount" Visible="false"></dx:GridViewDataTextColumn>
				</Columns>
				<Templates>
					<DetailRow>
						<dx:ASPxGridView ID="detailGrid" runat="server" DataSourceID="Products" KeyFieldName="ProductID" OnBeforePerformDataSelect="detailGrid_BeforePerformDataSelect"></dx:ASPxGridView>
					</DetailRow>
				</Templates>
				<SettingsDetail ShowDetailRow="true" />
			</dx:ASPxGridView>
		</div>
		<asp:SqlDataSource ID="Products" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [Products] WHERE [CategoryID]=@CategoryID">
			<SelectParameters>
				<asp:SessionParameter Name="CategoryID" SessionField="CategoryID" Type="Int32" />
			</SelectParameters>
		</asp:SqlDataSource>
		<asp:SqlDataSource ID="Categories" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>'
			SelectCommand="SELECT [CategoryID],[CategoryName],[Description],(SELECT COUNT(ProductID) from Products p where c.CategoryID = p.CategoryID) as ProductCount FROM Categories c;">
		</asp:SqlDataSource>
	</form>
</body>
</html>