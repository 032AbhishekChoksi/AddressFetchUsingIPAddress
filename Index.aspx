<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AddressFetchUsingIPAddress.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblIPAddresss" runat="server"></asp:Label>
        </div>
        <div>
            <asp:Label ID="lblCountry" runat="server"></asp:Label>
        </div>
        <div>
            <asp:Label ID="lblState" runat="server"></asp:Label>
        </div>
        <div>
            <asp:Label ID="lblCity" runat="server"></asp:Label>
        </div>
        <div>
            <asp:Label ID="lblPincode" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
