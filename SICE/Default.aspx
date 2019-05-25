<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SICE._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">



    <div class="row">
        <div class="col-md-10">
            <center><h2>Mapa de areas</h2></center>

                <p id="Ptest" runat="server"/>
            
            <div class="mapa" id="MapaDiv" runat="server">

            </div>


        </div>
        
    </div>

</asp:Content>
