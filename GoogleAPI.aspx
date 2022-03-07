<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GoogleAPI.aspx.cs" Inherits="AddressFetchUsingIPAddress.GoogleAPI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <script type="text/javascript" src="https://maps.google.com/maps/api/js?key=!!!!"></script>
        <script type="text/javascript">
            function getLocation() {
                getAddressInfoByZip(document.forms[0].txtZipCode.value);
            }
            function response(obj) {
                console.log(obj);
            }
            function getAddressInfoByZip(zip) {
                if (zip.length >= 5) {
                    var addr = {};
                    var geocoder = new google.maps.Geocoder();
                    geocoder.geocode({ 'address': zip }, function (results, status) {
                        if (status == google.maps.GeocoderStatus.OK) {
                            if (results.length >= 1) {
                                alert(results);
                            } else {
                                response({ success: false });
                            }
                        } else {
                            response({ success: false });
                        }
                    });
                } else {
                    response({ success: false });
                }
            }
        </script>
 
        <asp:TextBox ID="txtZipCode" runat="server" />
        <asp:Button ID="btn_Submit" runat="server" Text="Get" OnClientClick="getLocation();" />
    </form>
</body>
</html>
