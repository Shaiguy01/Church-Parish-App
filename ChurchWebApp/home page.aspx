<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home page.aspx.cs" Inherits="ChurchWebApp.home_page" %>

<!DOCTYPE html>

<form id="form1" runat="server">

<h1>Hello world</h1>
    <p>
        <asp:TextBox ID="firstnametb" runat="server" placeholder="First Name"></asp:TextBox>
        &nbsp;<asp:TextBox ID="gendertb" runat="server" placeholder="Gender"></asp:TextBox>
        &nbsp;<asp:TextBox ID="emailtb" runat="server" placeholder="Email"></asp:TextBox>
        &nbsp;<asp:TextBox ID="suburbtb" runat="server" placeholder="Suburb"></asp:TextBox>
        <asp:TextBox ID="preferedmasstimetb" runat="server" placeholder="Mass time"></asp:TextBox>
    </p>
   
    <asp:TextBox ID="lastnametb" runat="server" placeholder="Last Name"></asp:TextBox>
    &nbsp;<asp:TextBox ID="dateofbirthtb" runat="server" placeholder="Birthday DD/MM/YYYY"></asp:TextBox>
    &nbsp;<asp:TextBox ID="housenumbertb" runat="server" placeholder="House Number"></asp:TextBox>
    &nbsp;<asp:TextBox ID="occupationtb" runat="server" placeholder="Occupation"></asp:TextBox>
    <asp:TextBox ID="stewardshiptb" runat="server" placeholder="Stewardship"></asp:TextBox>
    <p>
        <asp:TextBox ID="agetb" runat="server" placeholder="Age"></asp:TextBox>
        &nbsp;<asp:TextBox ID="contactnumbertb" runat="server" placeholder="Contact#"></asp:TextBox>
        &nbsp;<asp:TextBox ID="roadnametb" runat="server" placeholder="Road Name"></asp:TextBox>
        &nbsp;<asp:TextBox ID="timeandtalentstb" runat="server" placeholder="Time and Talents"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </p>
    <p>
   
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="  Add  " />
   
    &nbsp;&nbsp;&nbsp;
   
    <asp:Button ID="BtnClear" runat="server" Text=" Clear " OnClick="BtnClear_Click" />
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="searchbtn" runat="server" Text="Search" OnClick="searchbtn_Click" />
   
    </p>
   
    <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#0000A9" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#000065" />
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
