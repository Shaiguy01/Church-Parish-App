<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home page.aspx.cs" Inherits="ChurchWebApp.home_page" %>

<!DOCTYPE html>

<form id="form1" runat="server">

    <html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <h1>Church Parish CRUD Web App (to soon be converted to a html, css, javascript -> app)</h1>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    </head>

    <p>
        <asp:TextBox ID="firstnametb" runat="server" placeholder="First Name"></asp:TextBox>

        &nbsp;<asp:DropDownList ID="gendertb" runat="server" AutoPostBack="False" AppendDataBoundItems="True" CssClass="form-control" DropDownListStyle="DropDownList">
            <asp:ListItem Text="Select Gender" Value=""></asp:ListItem>
            <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
            <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
        </asp:DropDownList>

        &nbsp;<asp:TextBox ID="emailtb" runat="server" placeholder="Email"></asp:TextBox>

        &nbsp;<asp:TextBox ID="suburbtb" runat="server" placeholder="Suburb"></asp:TextBox>

        <asp:DropDownList ID="preferedmasstimetb" runat="server" AutoPostBack="False" AppendDataBoundItems="True" CssClass="form-control" DropDownListStyle="DropDownList">
            <asp:ListItem Text="Select Mass Day" Value=""></asp:ListItem>
            <asp:ListItem Text="Saturday" Value="Saturday"></asp:ListItem>
            <asp:ListItem Text="Sunday" Value="Sunday"></asp:ListItem>
        </asp:DropDownList>
    </p>

    <asp:TextBox ID="lastnametb" runat="server" placeholder="Last Name"></asp:TextBox>

    <%--&nbsp;<asp:TextBox ID="dateofbirthtb" runat="server" placeholder="Birthday DD/MM/YYYY"></asp:TextBox>--%>
    &nbsp;<asp:TextBox ID="dateofbirthtb" runat="server" placeholder="Birthday MM/DD/YYYY"></asp:TextBox>
    <script>
        $(function () {
            $("#<%= dateofbirthtb.ClientID %>").datepicker({
                changeMonth: true,
                changeYear: true
            });
    });
    </script>



    <%--    &nbsp;<asp:TextBox ID="housenumbertb" runat="server" placeholder="House Number"></asp:TextBox>--%>
    &nbsp;<asp:TextBox ID="housenumbertb" runat="server" placeholder="House #" onkeypress="return isNumberKey(event)"></asp:TextBox>
    <script>
        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }
            return true;
        }
    </script>


    &nbsp;<asp:TextBox ID="occupationtb" runat="server" placeholder="Occupation"></asp:TextBox>

    <%--    &nbsp;<asp:TextBox ID="stewardshiptb" runat="server" placeholder="Stewardship"></asp:TextBox>--%>
    &nbsp;<asp:DropDownList ID="stewardshiptb" runat="server" AutoPostBack="False" AppendDataBoundItems="True" CssClass="form-control" DropDownListStyle="DropDownList">
        <asp:ListItem Text="Select Stewardship" Value=""></asp:ListItem>
        <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
        <asp:ListItem Text="No" Value="No"></asp:ListItem>
    </asp:DropDownList>
    <p>

        <asp:TextBox ID="agetb" runat="server" placeholder="Age" onkeypress="return isNumberKey(event)"></asp:TextBox>
        <script> <%--this si javascript code to make the functions of the textbox--%>
            function isNumberKey(evt) {
                var charCode = (evt.which) ? evt.which : event.keyCode;
                if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                    return false;
                }
                return true;
            }
        </script>

        <%--        &nbsp;<asp:TextBox ID="contactnumbertb" runat="server" placeholder="Contact#"></asp:TextBox>--%>
        &nbsp;<asp:TextBox ID="contactnumbertb" runat="server" placeholder="Contact #" onkeypress="return isNumberKey(event)"></asp:TextBox>
        <script> <%--this si javascript code to make the functions of the textbox--%>
            function isNumberKey(evt) {
                var charCode = (evt.which) ? evt.which : event.keyCode;
                if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                    return false;
                }
                return true;
            }
        </script>



        &nbsp;<asp:TextBox ID="roadnametb" runat="server" placeholder="Road Name"></asp:TextBox>

        <%--        &nbsp;<asp:TextBox ID="timeandtalentstb" runat="server" placeholder="Time and Talents"></asp:TextBox>--%>
        &nbsp;<asp:DropDownList ID="timeandtalentstb" runat="server" AutoPostBack="False" AppendDataBoundItems="True" CssClass="form-control" DropDownListStyle="DropDownList">
            <asp:ListItem Text="Select Time & Talents" Value=""></asp:ListItem>
            <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
            <asp:ListItem Text="No" Value="No"></asp:ListItem>
        </asp:DropDownList>

    </p>

    <p>

        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="  Add  " />

        &nbsp;&nbsp;&nbsp;
   
    <asp:Button ID="BtnClear" runat="server" Text="Refresh" OnClick="BtnClear_Click" />
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="searchbtn" runat="server" Text="Search" OnClick="searchbtn_Click" />

        &nbsp;
        <asp:Label ID="errormsgplace" runat="server" Text=""></asp:Label>

    </p>

    <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
        <alternatingrowstyle backcolor="#DCDCDC" />
        <footerstyle backcolor="#CCCCCC" forecolor="Black" />
        <headerstyle backcolor="#000084" font-bold="True" forecolor="White" />
        <pagerstyle backcolor="#999999" forecolor="Black" horizontalalign="Center" />
        <rowstyle backcolor="#EEEEEE" forecolor="Black" />
        <selectedrowstyle backcolor="#008A8C" font-bold="True" forecolor="White" />
        <sortedascendingcellstyle backcolor="#F1F1F1" />
        <sortedascendingheaderstyle backcolor="#0000A9" />
        <sorteddescendingcellstyle backcolor="#CAC9C9" />
        <sorteddescendingheaderstyle backcolor="#000065" />
    </asp:GridView>

    <p>
        <asp:TextBox ID="personidtb" runat="server" placeholder="Person ID"></asp:TextBox>
        &nbsp;<asp:TextBox ID="Firstname2tb" runat="server" placeholder="First Name"></asp:TextBox>
    </p>
    <asp:Button ID="deletebtn" runat="server" Text="Delete" OnClick="deletebtn_Click" />

    &nbsp;<br />
    &nbsp;<p>
        <asp:TextBox ID="messageTB" runat="server" Height="309px" Width="422px" TextMode="MultiLine" placeholder="Write your SMS here"></asp:TextBox>
    </p>
    <p>
        <asp:Button ID="Sendbtn" runat="server" OnClick="Button2_Click" Text="SEND TO ALL NUMBERS" />
    </p>


</form>
